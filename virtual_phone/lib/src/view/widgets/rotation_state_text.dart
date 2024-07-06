import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_state/provider.dart';
import 'rotation_text.dart';

class RotationStateText extends ConsumerWidget {
  const RotationStateText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceStateProvider);
    return RotationText(
      isPortrait: state.isPortrait,
    );
  }
}
