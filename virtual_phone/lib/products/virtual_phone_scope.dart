import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../src/dart_assets/devices/index.dart';
import '../src/logic/config/types/config.dart';
import '../src/state/device_model/notifier.dart';
import '../src/state/device_model/provider.dart';
import '../src/view/router/config_inherited_widget.dart';
import '../src/view/router/locale_updated_shell.dart';

final defaultConfig = Config(
  initialModelId: DeviceModelIds.all.first,
);

class VirtualPhoneScope extends StatelessWidget {
  const VirtualPhoneScope({
    super.key,
    this.config,
    required this.child,
  });

  final Config? config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return child;
    }

    final nonNullConfig = config ?? defaultConfig;

    return ProviderScope(
      overrides: [
        deviceModelIdProvider.overrideWith(() {
          return DeviceModelIdNotifier(
            initialModelId:
                nonNullConfig.initialModelId ?? DeviceModelIds.all.first,
          );
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
