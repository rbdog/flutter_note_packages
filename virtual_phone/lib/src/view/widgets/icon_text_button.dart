import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    this.onPressed,
    required this.icon,
    required this.text,
    this.margin = 8,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final Text text;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(width: margin),
          Flexible(child: text),
        ],
      ),
    );
  }
}
