import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../src/logic/config/types/config.dart';
import '../src/logic/device_model/types/preset_model.dart';
import '../src/state/device_model/notifier.dart';
import '../src/state/device_model/provider.dart';
import '../src/view/router/config_inherited.dart';
import '../src/view/router/locale_observer.dart';

final defaultConfig = Config(
  initialModelId: PresetModel.classicIphone.id,
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
                nonNullConfig.initialModelId ?? PresetModel.values.first.id,
          );
        })
      ],
      child: ConfigInherited(
        config: config,
        child: LocaleObserver(
          child: child,
        ),
      ),
    );
  }
}
