import 'package:flutter/material.dart';

import 'keyboard_button.dart';
import 'frame_theme.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    super.key,
    double? height,
  }) : height = height ?? minHeight;

  static const double minHeight = 214;
  final double height;
  static const double spacing = 12;

  Widget _row(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(
        top: spacing,
        left: spacing,
      ),
      child: Row(
        children: children,
      ),
    );
  }

  List<Widget> _letters(
    List<String> letters,
    Color backgroundColor,
    Color foregroundColor,
  ) {
    return letters
        .map<Widget>(
          (x) => Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: spacing,
              ),
              child: KeyboardButton(
                backgroundColor: backgroundColor,
                child: Text(
                  x,
                  style: TextStyle(
                    fontSize: 14,
                    color: foregroundColor,
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = DeviceFrameTheme.of(context).keyboardStyle;
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: height + mediaQuery.padding.bottom,
      padding: EdgeInsets.only(
        left: mediaQuery.padding.left + 1,
        right: mediaQuery.padding.right + 1,
      ),
      color: theme.backgroundColor,
      child: Column(
        children: <Widget>[
          _row(
            _letters(
              ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
              theme.button1BackgroundColor,
              theme.button1ForegroundColor,
            ),
          ),
          _row(
            _letters(
              ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
              theme.button1BackgroundColor,
              theme.button1ForegroundColor,
            ),
          ),
          _row([
            Padding(
              padding: const EdgeInsets.only(
                right: 12,
              ),
              child: KeyboardButton(
                backgroundColor: theme.button2BackgroundColor,
                child: Icon(
                  Icons.keyboard_capslock,
                  color: theme.button2ForegroundColor,
                  size: 16,
                ),
              ),
            ),
            ..._letters(
              ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
              theme.button1BackgroundColor,
              theme.button1ForegroundColor,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: spacing,
              ),
              child: KeyboardButton(
                backgroundColor: theme.button2BackgroundColor,
                child: Icon(
                  Icons.backspace,
                  color: theme.button2ForegroundColor,
                  size: 16,
                ),
              ),
            ),
          ]),
          _row(
            [
              Padding(
                padding: const EdgeInsets.only(
                  right: spacing,
                ),
                child: KeyboardButton(
                  backgroundColor: theme.button2BackgroundColor,
                  child: Text(
                    '123',
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.button2ForegroundColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: spacing,
                ),
                child: KeyboardButton(
                  backgroundColor: theme.button2BackgroundColor,
                  child: Icon(
                    Icons.insert_emoticon,
                    color: theme.button2ForegroundColor,
                    size: 16,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: spacing,
                  ),
                  child: KeyboardButton(
                    backgroundColor: theme.button2BackgroundColor,
                    child: Text(
                      'space',
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.button2ForegroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: spacing,
                ),
                child: KeyboardButton(
                  backgroundColor: theme.button2BackgroundColor,
                  child: Text(
                    'return',
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.button2ForegroundColor,
                    ),
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
