import 'package:flutter/material.dart';

import '../../logic/virtual_phone_config/types/virtual_phone_config.dart';

class ConfigInheritedWidget extends InheritedWidget {
  const ConfigInheritedWidget({
    super.key,
    required this.config,
    required super.child,
  });

  final VirtualPhoneConfig? config;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
