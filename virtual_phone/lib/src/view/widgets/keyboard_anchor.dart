import 'package:flutter/material.dart';

class KeyboardAnchor extends StatelessWidget {
  const KeyboardAnchor({
    super.key,
    required this.showKeyboard,
    required this.keyboard,
  });

  final bool showKeyboard;
  final Widget keyboard;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const SizedBox(),
      secondChild: keyboard,
      crossFadeState:
          showKeyboard ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 200),
    );
  }
}
