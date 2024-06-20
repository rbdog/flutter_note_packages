import 'package:flutter/material.dart';

import '../../state/models.dart';

extension ThemeBackgroundExtension on MobilePreviewBackgroundThemeData {
  /// Converts a [MobilePreviewBackgroundThemeData] to a [ThemeData].
  ThemeData asThemeData() {
    switch (this) {
      case MobilePreviewBackgroundThemeData.dark:
        return ThemeData.dark();
      case MobilePreviewBackgroundThemeData.light:
        return ThemeData.light();
    }
  }
}

extension ThemeToolbarExtension on MobilePreviewToolBarThemeData {
  /// Converts a [MobilePreviewToolBarThemeData] to a [ThemeData].
  ThemeData asThemeData() {
    switch (this) {
      case MobilePreviewToolBarThemeData.dark:
        final base = ThemeData.dark();
        const accentColor = Colors.white;
        return base.copyWith(
          colorScheme: const ColorScheme.dark(
            primary: accentColor,
            secondary: accentColor,
          ),
          primaryColor: accentColor,
          primaryColorDark: accentColor,
          indicatorColor: accentColor,
          highlightColor: accentColor.withOpacity(0.1),
          sliderTheme: base.sliderTheme.copyWith(
            thumbColor: accentColor,
            activeTrackColor: accentColor.withOpacity(0.7),
            inactiveTrackColor: accentColor.withOpacity(0.12),
            activeTickMarkColor: accentColor,
            inactiveTickMarkColor: accentColor,
            overlayColor: accentColor.withOpacity(0.12),
          ),
          checkboxTheme: CheckboxThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return accentColor;
              }
              return null;
            }),
          ),
          radioTheme: RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return accentColor;
              }
              return null;
            }),
          ),
          switchTheme: SwitchThemeData(
            thumbColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return accentColor;
              }
              return null;
            }),
            trackColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return accentColor;
              }
              return null;
            }),
          ),
        );
      case MobilePreviewToolBarThemeData.light:
        final base = ThemeData.light();
        const accentColor = Colors.black;
        const barColor = Color(0xFF303030);
        return base.copyWith(
          colorScheme: const ColorScheme.light(
            primary: accentColor,
            secondary: accentColor,
          ),
          primaryColor: accentColor,
          primaryColorDark: accentColor,
          indicatorColor: accentColor,
          highlightColor: accentColor,
          appBarTheme: base.appBarTheme.copyWith(
            color: barColor,
          ),
          sliderTheme: base.sliderTheme.copyWith(
            thumbColor: accentColor,
            activeTrackColor: accentColor.withOpacity(0.7),
            inactiveTrackColor: accentColor.withOpacity(0.12),
            activeTickMarkColor: accentColor,
            inactiveTickMarkColor: accentColor,
            overlayColor: accentColor.withOpacity(0.12),
          ),
          checkboxTheme: CheckboxThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return accentColor;
              }
              return null;
            }),
          ),
          radioTheme: RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return accentColor;
              }
              return null;
            }),
          ),
          switchTheme: SwitchThemeData(
            thumbColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return accentColor;
              }
              return null;
            }),
            trackColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return accentColor;
              }
              return null;
            }),
          ),
        );
    }
  }
}
