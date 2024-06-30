import 'package:flutter/material.dart';
import 'package:virtual_phone/src/view/router/orientation_updated_shell.dart';

import '../../logic/device_model/types/device_model.dart';
import 'hardware_screen.dart';

/// Simulate a physical device and embedding a virtual
class HardwareDeviceView extends StatelessWidget {
  const HardwareDeviceView({
    super.key,
    required this.deviceModel,
    required this.orientation,
    required this.screen,
  });

  /// All information related to the device.
  final DeviceModel deviceModel;

  /// The current frame simulated orientation.
  final Orientation orientation;

  /// The screen that should be inserted into the simulated
  final HardwareScreenView screen;

  @override
  Widget build(BuildContext context) {
    final screenPos = deviceModel.screen.position;
    final isPortrait = orientation == Orientation.portrait;

    final stack = Stack(
      children: [
        Positioned.fill(
          child: LayoutBuilder(
            builder: (_, constraints) {
              final deviceW = constraints.maxWidth;
              final deviceH = constraints.maxHeight;

              final leftPos = isPortrait ? screenPos.left : screenPos.top;
              final topPos = isPortrait ? screenPos.top : screenPos.right;
              final rightPos = isPortrait ? screenPos.right : screenPos.bottom;
              final bottomPos = isPortrait ? screenPos.bottom : screenPos.left;

              return Padding(
                padding: EdgeInsets.fromLTRB(
                  leftPos * deviceW,
                  topPos * deviceH,
                  rightPos * deviceW,
                  bottomPos * deviceH,
                ),
                child: screen,
              );
            },
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: RotatedBox(
            quarterTurns: isPortrait ? 0 : -1,
            child: Image.asset(
              package: 'virtual_phone',
              deviceModel.imageUri,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );

    return OrientationUpdatedShell(
      child: stack,
    );
  }
}
