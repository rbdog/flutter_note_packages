import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:virtual_phone/src/state/device_state/provider.dart';

class RotationObserver extends ConsumerWidget {
  const RotationObserver({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      deviceStateProvider,
      (_, next) {
        if (next.isPortrait) {
          SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
          );
        } else {
          SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
          );
        }
      },
    );

    return child;
  }
}
