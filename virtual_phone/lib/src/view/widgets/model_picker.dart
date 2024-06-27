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
    final devices = Devices.all
        .where(
          (it) => platform == it.id.platform,
        )
        .toList()
      ..sort((x, y) {
        final result = x.screenSize.width.compareTo(y.screenSize.width);
        return result == 0
            ? x.screenSize.height.compareTo(y.screenSize.height)
            : result;
      });

    return ListView(
      children: [
        ...devices.map(
          (it) => Tile(
            device: it,
          ),
        ),
      ],
    );
  }
}
