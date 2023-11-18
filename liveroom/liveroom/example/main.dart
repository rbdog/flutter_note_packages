import 'package:flutter/material.dart';
import 'package:liveroom/liveroom.dart';

//
// Please read out only "*" marked parts
//

// run multiple apps & check messages
void main() {
  runApp(const MyApp());
}

//
// * instance of LiveRoom
//
final liveroom = Liveroom();

/// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// push to Message Page
  void pushToMessagePage(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => _MessagePage(),
    );
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    final layout = _HomePageLayout(
      onTapCreate: () {
        //
        // * create Room
        //
        liveroom.create(roomId: '0001');
      },
      onTapJoin: () {
        //
        // * join Room
        //
        liveroom.join(roomId: '0001');
      },
    );

    //
    // * LiveroomView can receive events
    //
    return LiveroomView(
      liveroom: liveroom,
      onJoin: (userId) {
        //
        // * Someone joined
        //
        if (liveroom.myUserId == userId) {
          pushToMessagePage(context);
        }
      },
      child: layout,
    );
  }
}

/// Message Page
class _MessagePage extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    final layout = _MessagePageLayout(
      messages: messages,
      onTapExit: (() {
        //
        // * exit Room
        //
        liveroom.exit();

        popPage(context);
      }),
      onTapSend: ((text) {
        liveroom.send(message: text);
      }),
    );

    //
    // * LiveroomView can receive events
    //
    return LiveroomView(
      liveroom: liveroom,
      onJoin: (seatId) {
        //
        // * Someone joined
        //
        printMessage('--- JOIN ---');
      },
      onReceive: ((seatId, message) {
        //
        // * Someone sent message
        //
        printMessage(message);
      }),
      onExit: ((seatId) {
        //
        // * Someone exited
        //
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 24.0),
          bodyMedium: TextStyle(fontSize: 24.0),
          labelLarge: TextStyle(fontSize: 24.0),
          titleMedium: TextStyle(fontSize: 24.0),
          titleSmall: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
