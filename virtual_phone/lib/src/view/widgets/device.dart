import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_model/types/device_model.dart';
import '../../state/device_state/provider.dart';
import '../theme/platform.dart';
import 'hardware_device.dart';
import 'hardware_screen.dart';
import 'os.dart';

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
        platform: toFlutterPlatform(model.os.platform),
        visualDensity: VisualDensity.standard,
      ),
      child: HardwareDeviceView(
        deviceModel: model,
        isPortrait: state.isPortrait,
        screen: HardwareScreenView(
          deviceModel: model,
          isPortrait: state.isPortrait,
          builder: (screen) {
            return OSView(
              os: model.os,
              screen: screen,
              app: app,
            );
          },
        ),
      ),
    );
  }
}
