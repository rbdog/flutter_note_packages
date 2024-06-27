import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: const Text('Menu'),
        onTap: onTap,
        leading: const Icon(Icons.tune),
      ),
    );
  }
}
