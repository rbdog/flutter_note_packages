import 'package:mobile_preview/src/state/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'device_tile.dart';

class DevicePicker extends StatelessWidget {
  const DevicePicker({
    super.key,
    required this.platform,
  });

  final TargetPlatform platform;

  @override
  Widget build(BuildContext context) {
    final devices = context.select(
      (MobilePreviewStore store) => store.devices
          .where(
            (it) => platform == it.id.platform,
          )
          .toList()
        ..sort((x, y) {
          final result = x.screenSize.width.compareTo(y.screenSize.width);
          return result == 0
              ? x.screenSize.height.compareTo(y.screenSize.height)
              : result;
        }),
    );
    return ListView(
      children: [
        ...devices.map(
          (it) => DeviceTile(
            device: it,
          ),
        ),
      ],
    );
  }
}
