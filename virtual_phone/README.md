![Header](https://github.com/rbdog/flutter_note_packages/blob/main/virtual_phone/static/header-logo.png?raw=true)


A web-based smart phone simulator.

# Example

```
import 'package:flutter/material.dart';
import 'package:virtual_phone/virtual_phone.dart';

void main() {
  runApp(
    const VirtualPhoneScope(
      child: MyApp(),
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
    return Scaffold(
      body: ListView(
        children: List.generate(
          100,
          (i) => ListTile(
            title: Text('Tile $i'),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}

```
