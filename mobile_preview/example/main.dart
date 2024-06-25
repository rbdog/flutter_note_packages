import 'package:flutter/material.dart';
import 'package:mobile_preview/mobile_preview.dart';

void main() {
  runApp(
    const MobilePreviewScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: MobilePreview.locale(context),
      builder: MobilePreview.builder,
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
