import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_model/types/index.dart';
import '../../state/device_state/provider.dart';
import 'keyboard.dart';
import 'keyboard_anchor.dart';
import 'os_setings_shell.dart';

/// Display a simulated on screen keyboard at the bottom of a [child] widget.
class OSSafeAreaShell extends ConsumerWidget {
  const OSSafeAreaShell({
    super.key,
    required this.os,
    required this.screen,
    required this.child,
  });

  final SoftwareOS os;
  final SoftwareScreen screen;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceStateProvider);
    var mediaQuery = MediaQuery.of(context);

    final safeAreaInsets = screen.safeAreaInset;

    // viewInsets...スクリーンの端からデンジャーエリアの端まで
    late final EdgeInsets dangerAreaInsets;
    // viewPadding...変化しないデンジャーエリアの幅 (キーボードが出ても変わらない)
    late final EdgeInsets staticDangerAreaThickness;
    // padding...変化するデンジャーエリアの幅 (キーボードが出ると縮む)
    late final EdgeInsets dynamicDangerAreaThickness;

    if (state.showKeyboard) {
      // キーボードが出ているとき
      dangerAreaInsets = mediaQuery.viewInsets.copyWith(
        bottom: os.keyboardHeight + mediaQuery.viewInsets.bottom,
      );
      staticDangerAreaThickness = mediaQuery.viewPadding.copyWith(
        left: safeAreaInsets.left,
        top: safeAreaInsets.top,
        right: safeAreaInsets.right,
        bottom: safeAreaInsets.bottom,
      );
      dynamicDangerAreaThickness = mediaQuery.padding.copyWith(
        left: safeAreaInsets.left,
        top: safeAreaInsets.top,
        right: safeAreaInsets.right,
        bottom: (os.keyboardHeight > safeAreaInsets.bottom)
            ? 0
            : safeAreaInsets.bottom,
      );
    } else {
      dangerAreaInsets = mediaQuery.viewInsets;
      staticDangerAreaThickness = mediaQuery.viewPadding.copyWith(
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

    return MediaQuery(
      data: mediaQuery,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 0,
            width: screen.width,
            height: screen.height,
            child: OSSettingsShell(
              os: os,
              child: child,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: KeyboardAnchor(
              showKeyboard: state.showKeyboard,
              keyboard: Keyboard(height: os.keyboardHeight),
            ),
          ),
        ],
      ),
    );
  }
}
