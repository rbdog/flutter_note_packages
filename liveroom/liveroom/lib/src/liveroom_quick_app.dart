import 'package:flutter/material.dart';
import 'package:liveroom/src/liveroom.dart';
import 'package:liveroom/src/liveroom_view.dart';

/// Example app for Liveroom
class LiveroomQuickApp extends StatelessWidget {
  LiveroomQuickApp({
    Key? key,
  }) : super(key: key);

  final liveroom = Liveroom(logger: print);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _HomePage(liveroom),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 24.0),
          bodyText2: TextStyle(fontSize: 24.0),
          button: TextStyle(fontSize: 24.0),
          subtitle1: TextStyle(fontSize: 24.0),
          subtitle2: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

/// Home Page
class _HomePage extends StatelessWidget {
  const _HomePage(this.liveroom, {Key? key}) : super(key: key);

  final Liveroom liveroom;

  /// push to Message Page
  void pushToMessagePage(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => _MessagePage(liveroom),
    );
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    final layout = _HomePageLayout(
      onTapCreate: () async {
        await liveroom.create(roomId: '0001');
        // ignore: use_build_context_synchronously
        pushToMessagePage(context);
      },
      onTapJoin: () async {
        await liveroom.join(roomId: '0001');
        // ignore: use_build_context_synchronously
        pushToMessagePage(context);
      },
    );

    return layout;
  }
}

/// Message Page
class _MessagePage extends StatefulWidget {
  const _MessagePage(this.liveroom, {Key? key}) : super(key: key);

  final Liveroom liveroom;

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<_MessagePage> {
  final List<String> messages = [];

  void printMessage(String message) {
    setState(() {
      messages.add(message);
    });
  }

  void popPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  Liveroom get liveroom {
    return widget.liveroom;
  }

  @override
  Widget build(BuildContext context) {
    final layout = _MessagePageLayout(
      messages: messages,
      onTapExit: (() {
        liveroom.exit();
        popPage(context);
      }),
      onTapSend: ((text) {
        liveroom.send(message: text);
      }),
    );

    return LiveroomView(
      liveroom: liveroom,
      onJoin: (userId) {
        printMessage('--- JOIN ---');
      },
      onReceive: ((userId, message) {
        printMessage(message);
      }),
      onExit: ((userId) {
        printMessage('--- EXIT ---');
      }),
      child: layout,
    );
  }
}

/// Layout for HomePage
class _HomePageLayout extends StatelessWidget {
  const _HomePageLayout({
    required this.onTapCreate,
    required this.onTapJoin,
    Key? key,
  }) : super(key: key);

  final void Function() onTapCreate;
  final void Function() onTapJoin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: onTapCreate,
              child: const Text('Create\nRoom'),
            ),
            ElevatedButton(
              onPressed: onTapJoin,
              child: const Text('Join\nRoom'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Layout for MassagePage
class _MessagePageLayout extends StatelessWidget {
  const _MessagePageLayout({
    required this.messages,
    required this.onTapExit,
    required this.onTapSend,
    Key? key,
  }) : super(key: key);

  final List<String> messages;
  final void Function() onTapExit;
  final void Function(String text) onTapSend;

  Widget itemBuilder(BuildContext context, int index) {
    return Text(messages[index]);
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final topBar = Container(
      width: double.infinity,
      height: 100,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 50, height: 50),
          ElevatedButton(
            onPressed: onTapExit,
            child: const Text('Exit Room'),
          ),
        ],
      ),
    );
    final bottomBar = Container(
      width: double.infinity,
      height: 100,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
              ),
              controller: textController,
            ),
          ),
          ElevatedButton(
            onPressed: () => onTapSend(textController.text),
            child: const Text('Send'),
          ),
        ],
      ),
    );

    final messageListView = Expanded(
      child: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: messages.length,
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          topBar,
          messageListView,
          bottomBar,
        ],
      ),
    );
  }
}
