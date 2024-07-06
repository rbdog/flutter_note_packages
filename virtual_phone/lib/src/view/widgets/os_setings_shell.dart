import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_model/types/index.dart';
import '../../state/device_settings/provider.dart';

/// Display a simulated on screen keyboard at the bottom of a [child] widget.
class OSSettingsShell extends ConsumerWidget {
  const OSSettingsShell({
    super.key,
    required this.os,
    required this.child,
  });

  final SoftwareOS os;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(deviceSettingsProvider);
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);

    // brightness
    final brightness = settings.isDarkMode ? Brightness.dark : Brightness.light;

    // Apply
    theme = theme.copyWith(
      brightness: brightness,
    );

    // Apply
    mediaQuery = mediaQuery.copyWith(
      platformBrightness: brightness,
      textScaler: TextScaler.linear(settings.textScale),
      boldText: settings.boldText,
      disableAnimations: settings.disableAnimations,
      accessibleNavigation: settings.accessibleNavigation,
      invertColors: settings.invertColors,
    );

    return Theme(
      data: theme,
      child: MediaQuery(
        data: mediaQuery,
        child: child,
      ),
    );
  }
}
