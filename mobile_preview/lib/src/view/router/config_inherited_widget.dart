import 'package:flutter/material.dart';
import 'package:mobile_preview/src/logic/device/types/device.dart';

class ConfigInheritedWidget extends InheritedWidget {
  const ConfigInheritedWidget({
    super.key,
    required this.initialDevice,
    required super.child,
  });

  final Device? initialDevice;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is ConfigInheritedWidget) {
      return oldWidget.initialDevice != initialDevice;
    }
    return true;
  }
}
