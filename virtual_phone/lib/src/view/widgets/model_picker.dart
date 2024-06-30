import 'package:flutter/material.dart';
import 'package:virtual_phone/src/logic/device_model/config.dart';
import '../../logic/device_model/types/device_model.dart';
import 'model_tile.dart';

class ModelPicker extends StatelessWidget {
  const ModelPicker({
    super.key,
    required this.platform,
  });

  final Platform platform;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: presetDevices
          .where(
            (it) => it.label.platform == platform,
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
