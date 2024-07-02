import 'package:flutter/material.dart';
import 'package:virtual_phone/virtual_phone.dart';

final config = VirtualPhoneConfig(
  initialModelId: VirtualPhoneModelId.rotom.id,
);

void main() {
  runApp(
    VirtualPhoneScope(
      config: config,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: VirtualPhone.locale(context),
      builder: VirtualPhone.builder,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: mediaQuery.platformBrightness != Brightness.dark
          ? Colors.black
          : Colors.grey[200],
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: ListView(
            children: List.generate(
              100,
              (i) => ListTile(
                leading: Icon(
                  Icons.catching_pokemon,
                  color: mediaQuery.platformBrightness == Brightness.dark
                      ? Colors.green[200]
                      : Colors.green,
                ),
                title: Text(
                  'Tile $i',
                  style: TextStyle(
                    fontSize: 24,
                    color: mediaQuery.platformBrightness == Brightness.dark
                        ? Colors.green[200]
                        : Colors.green,
                  ),
                ),
                onTap: () {
                  go(context);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

go(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (c) {
    return const FlutterLogoPage();
  }));
}

class FlutterLogoPage extends StatelessWidget {
  const FlutterLogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: mediaQuery.platformBrightness == Brightness.dark
          ? Colors.black
          : Colors.grey[200],
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          color: Colors.green,
          child: FlutterLogo(
            size: 120,
          ),
        ),
      ),
    );
  }
}
