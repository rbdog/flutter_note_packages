import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_model/types/device_model.dart';
import '../../state/device_settings/provider.dart';
import 'keyboard.dart';

/// Display a simulated on screen keyboard at the bottom of a [app] widget.
class OSView extends ConsumerWidget {
  const OSView({
    super.key,
    required this.showKeyboard,
    required this.app,
    required this.screenWidth,
    required this.screenHeight,
    required this.os,
  });

  /// Indicates whether the keyboard is displayed or not.
  final bool showKeyboard;

  final OS os;
  final double screenWidth;
  final double screenHeight;

  /// The widget on top of which the keyboard is displayed.
  final Widget app;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(deviceSettingsProvider);
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final safeAreaInsets =
        isPortrait ? os.portRaitSafeAreaInset : os.landscapeSafeAreaInset;

    // viewInsets...スクリーンの端からデンジャーエリアの端まで
    late final EdgeInsets dangerAreaInsets;
    // viewPadding...変化しないデンジャーエリアの幅 (キーボードが出ても変わらない)
    late final EdgeInsets staticDangerAreaThickness;
    // padding...変化するデンジャーエリアの幅 (キーボードが出ると縮む)
    late final EdgeInsets dynamicDangerAreaThickness;

    if (showKeyboard) {
      // キーボードが出ているとき
      dangerAreaInsets = mediaQuery.viewInsets.copyWith(
        bottom: os.keyboardHeight + mediaQuery.padding.bottom,
      );
      staticDangerAreaThickness = mediaQuery.viewPadding;
      dynamicDangerAreaThickness = mediaQuery.padding.copyWith(
        bottom: 0,
      );
    } else {
      dangerAreaInsets = EdgeInsets.zero;
      staticDangerAreaThickness = mediaQuery.padding.copyWith(
        left: safeAreaInsets.left,
        top: safeAreaInsets.top,
        right: safeAreaInsets.right,
        bottom: safeAreaInsets.bottom,
      );
      dynamicDangerAreaThickness = mediaQuery.padding.copyWith(
        left: safeAreaInsets.left,
        top: safeAreaInsets.top,
        right: safeAreaInsets.right,
        bottom: safeAreaInsets.bottom,
      );
    }

    // Apply
    mediaQuery = mediaQuery.copyWith(
      viewInsets: dangerAreaInsets,
      viewPadding: staticDangerAreaThickness,
      padding: dynamicDangerAreaThickness,
    );

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

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Theme(
              data: theme,
              child: MediaQuery(
                data: mediaQuery,
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight,
                  child: app,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: Keyboard(height: os.keyboardHeight),
              crossFadeState: showKeyboard
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
          ),
        ],
      ),
    );
  }
}
