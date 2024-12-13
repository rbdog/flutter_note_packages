import 'dart:async';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum _LiveAction {
  join(0),
  message(1),
  exit(2);

  final int rawValue;
  const _LiveAction(this.rawValue);
  factory _LiveAction.from({required int rawValue}) {
    final value = _LiveAction.values.firstWhere((e) => e.rawValue == rawValue);
    return value;
  }
}

class _LiveMail {
  _LiveMail({
    required this.action,
    required this.userId,
    required this.message,
  });
  final _LiveAction action;
  final String userId;
  final String message;
  _LiveMail.fromJson(Map<String, dynamic> json)
      : action = _LiveAction.from(rawValue: json['action']),
        userId = json['user_id'],
        message = json['message'];
  Map<String, dynamic> toJson() => {
        'action': action,
        'user_id': userId,
        'message': message,
      };
}

enum Scheme {
  ws('ws');

  final String rawValue;
  const Scheme(this.rawValue);
}

class _LiveroomConfig {
  _LiveroomConfig({
    required this.scheme,
    required this.host,
    required this.rootPath,
    required this.port,
  });

  final Scheme scheme;
  final String host;
  final String rootPath;
  final int port;
  String? roomId;
  String? userId;
}

class Liveroom {
  Liveroom({
    Scheme scheme = Scheme.ws,
    String host = '0.0.0.0',
    String rootPath = '/liveroom',
    int port = 5000,
    this.logger,
  }) : _config = _LiveroomConfig(
          scheme: scheme,
          host: host,
          rootPath: rootPath,
          port: port,
        );

  WebSocketChannel? _channel;
  var _sendCtrl = StreamController<_LiveMail>.broadcast();
  var _joinCtrl = StreamController<String>.broadcast();
  var _exitCtrl = StreamController<String>.broadcast();
  var _errCtrl = StreamController<String>.broadcast();
  final _LiveroomConfig _config;
  final void Function(String log)? logger;

  // connect WebSocket
  void _connect(
    String apiPath,
    String roomId, {
    required String? optUserId,
    required void Function(Object error) onError,
  }) {
    logger?.call('_connect called');
    final userId = optUserId ?? const Uuid().v4();
    final url = Uri(
      scheme: _config.scheme.rawValue,
      host: _config.host,
      path: _config.rootPath + apiPath,
      port: _config.port,
      queryParameters: {
        'room_id': roomId,
        'user_id': userId,
      },
    );
    logger?.call('Connecting: ${url.toString()}');
    _channel = WebSocketChannel.connect(url);

    // save roomId, userId
    _config.roomId = roomId;
    _config.userId = userId;
    // WebSocket Listen
    _channel?.stream.listen(
      (event) {
        final json = jsonDecode(event);
        final mail = _LiveMail.fromJson(json);
        switch (mail.action) {
          case _LiveAction.join:
            _joinCtrl.sink.add(mail.userId);
            break;
          case _LiveAction.message:
            _sendCtrl.sink.add(mail);
            break;
          case _LiveAction.exit:
            _exitCtrl.sink.add(mail.userId);
            break;
        }
      },
      cancelOnError: true,
      onError: (Object error) {
        logger?.call('ConnectingError: ${error.toString()}');
        onError(error);
      },
      onDone: () {
        /// disconnected
        _exitCtrl.sink.add(userId);
      },
    );
  }

  bool get isJoined {
    return _channel != null;
  }

  String? get myUserId {
    return _config.userId;
  }

  /// create Room
  Future<void> create({required String roomId, String? userId}) async {
    logger?.call('create called');
    if (isJoined) {
      logger?.call('exiting old room ...');
      await exit();
      logger?.call('exited old room');
    }
    var completer = Completer<void>();
    late final StreamSubscription<String> subs;
    subs = _joinCtrl.stream.listen((userId) {
      if (userId == myUserId) {
        logger?.call('I joined');
        subs.cancel();
        completer.complete();
      }
    });
    _connect(
      '/create',
      roomId,
      optUserId: userId,
      onError: (Object error) {
        subs.cancel();
        completer.completeError(error);
        _errCtrl.sink.add(error.toString());
      },
    );
    return completer.future;
  }

  /// join Room
  Future<void> join({required String roomId, String? userId}) async {
    logger?.call('join called');
    if (isJoined) {
      logger?.call('exiting old room ...');
      await exit();
      logger?.call('exited old room');
    }
    var completer = Completer<void>();
    late final StreamSubscription<String> subs;
    subs = _joinCtrl.stream.listen((userId) {
      if (userId == myUserId) {
        logger?.call('I joined');
        subs.cancel();
        completer.complete();
      }
    });
    _connect(
      '/join',
      roomId,
      optUserId: userId,
      onError: (Object error) {
        subs.cancel();
        completer.completeError(error);
        _errCtrl.sink.add(error.toString());
      },
    );
    return completer.future;
  }

  /// listen for someone's join
  StreamSubscription onJoin(void Function(String userId) process) {
    logger?.call('onJoin called');
    final subs = _joinCtrl.stream.listen((body) {
      process(body);
    });
    return subs;
  }

  // send message to the room
  void send({required String message}) {
    logger?.call('send called');
    if (!isJoined) {
      logger?.call('Not joined Room');
      return;
    }
    _channel?.sink.add(message);
  }

  /// listen for someone's message
  StreamSubscription receive(
    void Function(String userId, String message) process,
  ) {
    logger?.call('receive called');
    final subs = _sendCtrl.stream.listen((liveEvent) {
      process(liveEvent.userId, liveEvent.message);
    });
    return subs;
  }

  // exit room
  Future<void> exit() async {
    logger?.call('exit called');
    await _channel?.sink.close();
    _channel = null;
    _config.roomId = null;
  }

  /// listen for someone's exit
  StreamSubscription onExit(void Function(String userId) process) {
    logger?.call('onExit called');
    final subs = _exitCtrl.stream.listen((body) {
      process(body);
    });
    return subs;
  }

  /// listen for error
  StreamSubscription onError(void Function(String errorMessage) process) {
    logger?.call('onError called');
    final subs = _errCtrl.stream.listen((errString) {
      process(errString);
    });
    return subs;
  }

  /// * RESET ALL Liveroom state
  Future<void> reset() async {
    logger?.call('reset called');
    await _sendCtrl.sink.close();
    await _joinCtrl.sink.close();
    await _exitCtrl.sink.close();
    await _errCtrl.sink.close();
    _sendCtrl = StreamController<_LiveMail>.broadcast();
    _joinCtrl = StreamController<String>.broadcast();
    _exitCtrl = StreamController<String>.broadcast();
    _errCtrl = StreamController<String>.broadcast();
    await _channel?.sink.close();
    _channel = null;
    _config.roomId = null;
  }
}
