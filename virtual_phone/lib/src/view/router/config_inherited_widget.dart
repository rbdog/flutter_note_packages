import 'package:flutter/material.dart';

import '../../logic/config/types/config.dart';

class ConfigInheritedWidget extends InheritedWidget {
  const ConfigInheritedWidget({
    super.key,
    required this.config,
    required super.child,
  });

  final Config? config;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
