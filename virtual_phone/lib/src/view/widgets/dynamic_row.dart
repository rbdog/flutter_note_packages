import 'package:flutter/material.dart';

class DynamicRow extends StatelessWidget {
  const DynamicRow({
    super.key,
    required this.itemCount,
    required this.builder,
    required this.spacing,
  });

  final int itemCount;
  final Widget Function(int index) builder;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (int i = 0; i < itemCount; i++) {
      final child = builder(i);
      widgets.add(child);

      // 最後の要素でなければスペースを追加
      if (i < itemCount - 1) {
        widgets.add(SizedBox(width: spacing));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }
}
