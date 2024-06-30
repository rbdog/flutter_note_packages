import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'keyboard_style.freezed.dart';

/// The keyboard style allows to customize the virtual onscreen keyboard visuals.
@freezed
abstract class KeyboardStyle with _$KeyboardStyle {
  const factory KeyboardStyle({
    required Color backgroundColor,
    required Color button1BackgroundColor,
    required Color button1ForegroundColor,
    required Color button2BackgroundColor,
    required Color button2ForegroundColor,
  }) = _KeyboardStyle;

  /// A default dark theme for the virtual keyboard.
  factory KeyboardStyle.dark() => const KeyboardStyle(
        backgroundColor: Color(0xDD2B2B2D),
        button1BackgroundColor: Color(0xFF6D6D6E),
        button1ForegroundColor: Colors.white,
        button2BackgroundColor: Color(0xFF4A4A4B),
        button2ForegroundColor: Colors.white,
      );
}
