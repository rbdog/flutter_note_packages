import 'package:flutter/material.dart';

class BottomMenuBar extends StatelessWidget {
  const BottomMenuBar({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: const Text('Mobile Preview'),
        onTap: onTap,
        leading: const Icon(Icons.tune),
      ),
    );
  }
}
