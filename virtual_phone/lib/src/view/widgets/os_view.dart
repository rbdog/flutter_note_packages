import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_settings/provider.dart';
import 'keyboard.dart';

/// Display a simulated on screen keyboard at the bottom of a [child] widget.
class OSView extends ConsumerWidget {
  const OSView({
    super.key,
    this.showKeyboard = false,
    required this.child,
  });

  /// Indicates whether the keyboard is displayed or not.
  final bool showKeyboard;

  /// The widget on top of which the keyboard is displayed.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(deviceSettingsProvider);

    late final MediaQueryData mediaQuery;
    if (showKeyboard) {
      mediaQuery = _applyKeyboardToMediaQuery(MediaQuery.of(context));
    } else {
      mediaQuery = MediaQuery.of(context);
    }

    return Theme(
      data: Theme.of(context).copyWith(
        brightness: settings.isDarkMode ? Brightness.dark : Brightness.light,
      ),
      child: MediaQuery(
        data: mediaQuery.copyWith(
          platformBrightness:
              settings.isDarkMode ? Brightness.dark : Brightness.light,
          textScaler: TextScaler.linear(settings.textScaleFactor),
          boldText: settings.boldText,
          disableAnimations: settings.disableAnimations,
          accessibleNavigation: settings.accessibleNavigation,
          invertColors: settings.invertColors,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: child,
            ),
            Positioned(
              bottom: -1,
              left: -1,
              right: -1,
              child: AnimatedCrossFade(
                firstChild: const SizedBox(),
                secondChild: const Keyboard(
                  height: Keyboard.minHeight,
                ),
                crossFadeState: showKeyboard
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Adds the keyboard insets to the given [mediaQuery].
MediaQueryData _applyKeyboardToMediaQuery(MediaQueryData mediaQuery) {
  final insets = EdgeInsets.only(
    bottom: Keyboard.minHeight + mediaQuery.padding.bottom,
  );
  return mediaQuery.copyWith(
    viewInsets: insets,
    viewPadding: mediaQuery.viewPadding,
    padding: mediaQuery.padding.copyWith(
      bottom: 0,
    ),
  );
}
