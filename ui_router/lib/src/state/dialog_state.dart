//
//
//

import 'dart:async';
import 'package:ui_router/src/state/dialog_answer.dart';

class UiDialogState {
  UiDialogState({
    required this.name,
    required this.params,
  });

  final String name;
  final Map<String, String> params;

  /// custom event completer
  StreamController<String>? eventStreamer;

  /// answer completer
  Completer<UiAnswer>? answerCompleter;

  /// Trigger event
  void sendEvent(String value) {
    eventStreamer?.sink.add(value);
  }

  /// Listen event
  void receiveEvent(void Function(String? value) action) {
    eventStreamer = StreamController<String>();
    eventStreamer!.stream.listen((value) {
      action(value);
    });
  }

  /// wait button tap event
  Future<UiAnswer> receiveAnswer() {
    answerCompleter = Completer<UiAnswer>();
    return answerCompleter!.future;
  }

  /// send button tap event
  void sendAnswer(UiAnswer answer) {
    answerCompleter?.complete(answer);
    answerCompleter = null;
  }

  /// dispose
  void dispose() {
    eventStreamer?.close();
  }
}
