import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:virtual_phone/src/state/device_model/provider.dart';

import 'menu_section.dart';
import 'platform_icon.dart';
import 'platform_picker.dart';

/// All the simulated properties for the device.
class ModelSection extends ConsumerWidget {
  const ModelSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceModel = ref.watch(deviceModelProvider);

    return MenuSection(
      title: 'Pick Model',
      children: [
        ListTile(
          key: const Key('Model'),
          title: Text(deviceModel.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PlatformIcon(
                platform: deviceModel.id.platform,
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
          onTap: () {
            final theme = Theme.of(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Theme(
                  data: theme,
                  child: PlatformPicker(platform: deviceModel.id.platform),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
