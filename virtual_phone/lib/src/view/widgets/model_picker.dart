import 'package:flutter/material.dart';
import '../../dart_assets/devices/index.dart';
import 'model_tile.dart';

class ModelPicker extends StatelessWidget {
  const ModelPicker({
    super.key,
    required this.platform,
  });

  final TargetPlatform platform;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: DeviceModels.all
          .where(
            (it) => it.platform == platform,
          )
          .map(
            (it) => ModelTile(
              device: it,
            ),
          )
          .toList(),
    );
  }
}
