import 'package:flutter/material.dart';

class BottomToolbar extends StatelessWidget {
  const BottomToolbar({
    super.key,
    required this.showPanel,
  });

  final VoidCallback showPanel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: const Text('Mobile Preview'),
        onTap: showPanel,
        leading: const Icon(Icons.tune),
      ),
    );
  }
}
