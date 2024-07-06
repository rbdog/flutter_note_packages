import 'package:flutter/material.dart';

import '../../logic/device_model/types/device_model.dart';
import '../router/rotation_observer.dart';
import 'hardware_screen.dart';

/// Simulate a physical device and embedding a virtual
class HardwareDeviceView extends StatelessWidget {
  const HardwareDeviceView({
    super.key,
    required this.deviceModel,
    required this.isPortrait,
    required this.screen,
  });

  /// All information related to the device.
  final DeviceModel deviceModel;

  /// The current frame simulated orientation.
  final bool isPortrait;

  /// The screen that should be inserted into the simulated
  final HardwareScreenView screen;

  @override
  Widget build(BuildContext context) {
    final screenPos = deviceModel.hardwareScreen.position;

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
              deviceModel.hardwareImageUri,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );

    return RotationObserver(
      child: stack,
    );
  }
}
