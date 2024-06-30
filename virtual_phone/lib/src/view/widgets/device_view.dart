import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:virtual_phone/src/view/widgets/screenshot_view.dart';

import '../../logic/device_model/types/device_model.dart';
import '../../state/device_state/provider.dart';
import '../widgets/device_frame_view.dart';
import '../widgets/os_view.dart';

class DeviceView extends ConsumerWidget {
  const DeviceView({
    super.key,
    required this.deviceModel,
    required this.child,
  });

  final OldDeviceModel deviceModel;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final deviceState = ref.watch(deviceStateProvider);

    return Theme(
      data: theme.copyWith(
        platform: deviceModel.platform,
        visualDensity: VisualDensity.standard,
      ),
      child: DeviceFrameView(
        deviceModel: deviceModel,
        orientation: deviceState.orientation,
        child: ScreenshotView(
          child: OSView(
            showKeyboard: deviceState.isVirtualKeyboardVisible,
            child: child,
          ),
        ),
      ),
    );
  }
}
