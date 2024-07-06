import 'package:flutter/material.dart';

import '../../logic/config/types/config.dart';

class ConfigInherited extends InheritedWidget {
  const ConfigInherited({
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
