import 'package:flutter/material.dart';
import 'package:virtual_phone/virtual_phone.dart';

final config = VirtualPhoneConfig(
  initialDeviceModel: VirtualPhoneModel.ios.iPhone13,
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