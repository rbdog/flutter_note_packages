import 'package:mobile_preview/src/state/store.dart';
import 'package:mobile_preview/src/view/widgets/target_platform_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/device/types/device.dart';

/// A page for picking a simulated device model.
class DeviceModelPicker extends StatefulWidget {
  /// Create a new page for picking a simulated device model.
  const DeviceModelPicker({
    super.key,
  });

  @override
  State<DeviceModelPicker> createState() => _DeviceModelPickerState();
}

class _DeviceModelPickerState extends State<DeviceModelPicker>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(
    vsync: this,
    length: _allPlatforms.length + 1,
    initialIndex: () {
      final store = context.read<MobilePreviewStore>();
      final platform = store.device.id.platform;
      return _allPlatforms.indexOf(platform);
    }(),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device model'),
        bottom: TabBar(
          controller: controller,
          isScrollable: true,
          tabs: [
            ..._allPlatforms.map(
              (e) => Tab(
                icon: TargetPlatformIcon(platform: e),
                text: e.name,
              ),
            ),
            const Tab(
              icon: Icon(Icons.tune),
              text: 'Custom',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ..._allPlatforms.map(
            (e) => _PlatformModelPicker(
              platform: e,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlatformModelPicker extends StatelessWidget {
  const _PlatformModelPicker({
    required this.platform,
  });

  final TargetPlatform platform;

  @override
  Widget build(BuildContext context) {
    final devices = context.select(
      (MobilePreviewStore store) => store.devices
          .where(
            (x) => platform == x.id.platform,
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
          (d) => DeviceTile(
            info: d,
          ),
        ),
      ],
    );
  }
}

class DeviceTile extends StatelessWidget {
  const DeviceTile({
    super.key,
    required this.info,
  });

  final Device info;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(info.name),
      subtitle: Text(
        '${info.screenSize.width}x${info.screenSize.height} @${info.pixelRatio}',
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
      onTap: () {
        final state = context.read<MobilePreviewStore>();
        state.selectDevice(info.id);
      },
    );
  }
}

const _allPlatforms = <TargetPlatform>[
  TargetPlatform.iOS,
  TargetPlatform.android,
  TargetPlatform.macOS,
  TargetPlatform.windows,
  TargetPlatform.linux,
];
