import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_model/config/preset_models.dart';
import '../../state/device_model/provider.dart';
import 'minimal_tile.dart';
import 'platform_icon.dart';

class PickModelTile extends ConsumerWidget {
  const PickModelTile({
    super.key,
    required this.modelId,
  });

  final String modelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(deviceModelIdProvider.notifier);

    final model = presetModels.firstWhere(
      (it) {
        return it.id == modelId;
      },
    );

    return MinimalTile.tapAction(
      title: Text(model.label.name),
      icon: PlatformIcon(
        platform: model.os.platform,
      ),
      onTap: () {
        notifier.setId(modelId);
      },
    );
  }
}
