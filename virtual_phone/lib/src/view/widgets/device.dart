import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:virtual_phone/src/view/theme/platform.dart';
import 'package:virtual_phone/src/view/widgets/hardware_screen.dart';
import 'package:virtual_phone/src/view/widgets/os.dart';

import '../../logic/device_model/types/device_model.dart';
import '../../state/device_state/provider.dart';
import 'hardware_device.dart';

class DeviceView extends ConsumerWidget {
  const DeviceView({
    super.key,
    required this.model,
    required this.app,
  });

  final DeviceModel model;
  final Widget app;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(deviceStateProvider);

    return Theme(
      data: theme.copyWith(
        platform: toFlutterPlatform(model.label.platform),
        visualDensity: VisualDensity.standard,
      ),
      child: HardwareDeviceView(
        deviceModel: model,
        orientation: state.orientation,
        screen: HardwareScreenView(
          deviceModel: model,
          orientation: state.orientation,
          builder: (size) {
            return OSView(
              os: model.os,
              screenWidth: size.width,
              screenHeight: size.height,
              app: app,
            );
          },
        ),
      ),
    );
  }
}
