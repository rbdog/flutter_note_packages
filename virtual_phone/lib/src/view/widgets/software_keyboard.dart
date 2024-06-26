import 'package:flutter/material.dart';

import 'software_keyboard_button.dart';
import 'frame_theme.dart';

/// Display a simulated on screen keyboard at the bottom of a [child] widget.
class SoftwareKeyboard extends StatelessWidget {
  const SoftwareKeyboard({
    super.key,
    required this.child,
    this.isEnabled = false,
    this.transitionDuration = const Duration(milliseconds: 400),
  });

  /// Adds the keyboard insets to the given [mediaQuery].
  static MediaQueryData mediaQuery(MediaQueryData mediaQuery) {
    final insets = EdgeInsets.only(
      bottom: _VirtualKeyboard.minHeight + mediaQuery.padding.bottom,
    );
    return mediaQuery.copyWith(
      viewInsets: insets,
      viewPadding: mediaQuery.viewPadding,
      padding: mediaQuery.padding.copyWith(
        bottom: 0,
      ),
    );
  }

  /// Indicates whether the keyboard is displayed or not.
  final bool isEnabled;

  /// The widget on top of which the keyboard is displayed.
  final Widget child;

  /// The transition duration when the keyboard is displayed or hidden.
  final Duration transitionDuration;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: MediaQuery(
            data: !isEnabled
                ? mediaQuery
                : SoftwareKeyboard.mediaQuery(mediaQuery),
            child: child,
          ),
        ),
        Positioned(
          bottom: -1,
          left: -1,
          right: -1,
          child: AnimatedCrossFade(
            firstChild: const SizedBox(),
            secondChild: const _VirtualKeyboard(
              height: _VirtualKeyboard.minHeight,
            ),
            crossFadeState: isEnabled
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: transitionDuration,
          ),
        ),
      ],
    );
  }
}

class _VirtualKeyboard extends StatelessWidget {
  const _VirtualKeyboard({
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
              child: SoftwareKeyboardButton(
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
              child: SoftwareKeyboardButton(
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
              child: SoftwareKeyboardButton(
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
                child: SoftwareKeyboardButton(
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
                child: SoftwareKeyboardButton(
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
                  child: SoftwareKeyboardButton(
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
                child: SoftwareKeyboardButton(
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
