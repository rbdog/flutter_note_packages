import 'package:flutter/material.dart';
import 'package:virtual_phone/src/view/theme/keyboard_style.dart';
import 'package:virtual_phone/src/view/widgets/dynamic_row.dart';

import 'keyboard_button.dart';

final _letters1 = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
final _letters2 = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
final _letters3 = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

Widget _letterButton(
  String letter,
  Color backgroundColor,
  Color foregroundColor,
) {
  return Flexible(
    child: KeyboardButton(
      backgroundColor: backgroundColor,
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 14,
          color: foregroundColor,
        ),
      ),
    ),
  );
}

class Keyboard extends StatelessWidget {
  const Keyboard({
    super.key,
    required this.height,
  });

  final double height;
  static const double halfSpacing = 6;
  static const double spacing = 12;

  @override
  Widget build(BuildContext context) {
    final style = KeyboardStyle.dark();
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: height,
      padding: EdgeInsets.only(
        top: spacing,
        left: mediaQuery.padding.left + halfSpacing,
        right: mediaQuery.padding.right + halfSpacing,
        bottom: mediaQuery.viewPadding.bottom + halfSpacing,
      ),
      color: style.backgroundColor,
      child: Column(
        children: [
          DynamicRow(
            itemCount: _letters1.length,
            builder: (i) => _letterButton(
              _letters1[i],
              style.button1BackgroundColor,
              style.button1ForegroundColor,
            ),
            spacing: halfSpacing,
          ),
          const SizedBox(height: spacing),
          DynamicRow(
            itemCount: _letters2.length,
            builder: (i) => _letterButton(
              _letters2[i],
              style.button1BackgroundColor,
              style.button1ForegroundColor,
            ),
            spacing: halfSpacing,
          ),
          const SizedBox(height: spacing),
          Row(
            children: [
              KeyboardButton(
                backgroundColor: style.button2BackgroundColor,
                child: Icon(
                  Icons.keyboard_capslock,
                  color: style.button2ForegroundColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: halfSpacing),
              Expanded(
                child: DynamicRow(
                  itemCount: _letters3.length,
                  builder: (i) => _letterButton(
                    _letters3[i],
                    style.button1BackgroundColor,
                    style.button1ForegroundColor,
                  ),
                  spacing: halfSpacing,
                ),
              ),
              const SizedBox(width: halfSpacing),
              KeyboardButton(
                backgroundColor: style.button2BackgroundColor,
                child: Icon(
                  Icons.backspace,
                  color: style.button2ForegroundColor,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: spacing),
          Row(
            children: [
              KeyboardButton(
                backgroundColor: style.button2BackgroundColor,
                child: Text(
                  '123',
                  style: TextStyle(
                    fontSize: 14,
                    color: style.button2ForegroundColor,
                  ),
                ),
              ),
              const SizedBox(width: halfSpacing),
              KeyboardButton(
                backgroundColor: style.button2BackgroundColor,
                child: Icon(
                  Icons.insert_emoticon,
                  color: style.button2ForegroundColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: halfSpacing),
              Expanded(
                child: KeyboardButton(
                  backgroundColor: style.button2BackgroundColor,
                  child: Text(
                    'space',
                    style: TextStyle(
                      fontSize: 14,
                      color: style.button2ForegroundColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: halfSpacing),
              KeyboardButton(
                backgroundColor: style.button2BackgroundColor,
                child: Text(
                  'return',
                  style: TextStyle(
                    fontSize: 14,
                    color: style.button2ForegroundColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
