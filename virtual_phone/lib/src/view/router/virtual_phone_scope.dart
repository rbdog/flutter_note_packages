import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dart_assets/devices/index.dart';
import '../../logic/virtual_phone_config/types/virtual_phone_config.dart';
import '../../state/device_model/provider.dart';
import 'config_inherited_widget.dart';
import 'locale_updated_shell.dart';

class VirtualPhoneScope extends StatelessWidget {
  const VirtualPhoneScope({
    super.key,
    this.config,
    required this.child,
  });

  final VirtualPhoneConfig? config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        defaultDeviceModelProvider.overrideWith((ref) {
          return config?.initialDeviceModel ?? Devices.all.first;
        })
      ],
      child: ConfigInheritedWidget(
        config: config,
        child: LocaleUpdatedShell(
          child: child,
        ),
      ),
    );
  }
}
