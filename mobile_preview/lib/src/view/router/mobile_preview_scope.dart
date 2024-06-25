import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_preview/src/dart_assets/devices/index.dart';
import 'package:mobile_preview/src/logic/device/types/device.dart';
import 'package:mobile_preview/src/state/device/provider.dart';
import 'package:mobile_preview/src/view/router/config_inherited_widget.dart';
import 'package:mobile_preview/src/view/router/locale_updated_shell.dart';

class MobilePreviewScope extends StatelessWidget {
  const MobilePreviewScope({
    super.key,
    this.initialDevice,
    required this.child,
  });

  final Device? initialDevice;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        defaultDeviceProvider.overrideWith((ref) {
          return initialDevice ?? Devices.all.first;
        })
      ],
      child: ConfigInheritedWidget(
        initialDevice: initialDevice,
        child: LocaleUpdatedShell(
          child: child,
        ),
      ),
    );
  }
}
