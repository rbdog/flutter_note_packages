import 'package:mobile_preview/src/state/store.dart';
import 'package:mobile_preview/src/view/widgets/platform_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/device/config.dart';
import 'device_picker.dart';

/// A page for picking a simulated device model.
class PlatformPicker extends StatefulWidget {
  const PlatformPicker({
    super.key,
  });

  @override
  State<PlatformPicker> createState() => _PlatformPickerState();
}

class _PlatformPickerState extends State<PlatformPicker>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(
    vsync: this,
    length: allPlatforms.length,
    initialIndex: () {
      final store = context.read<MobilePreviewStore>();
      final platform = store.device.id.platform;
      return allPlatforms.indexOf(platform);
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
        title: const Text('Device'),
        bottom: TabBar(
          controller: controller,
          isScrollable: true,
          tabs: allPlatforms
              .map(
                (it) => Tab(
                  icon: PlatformIcon(platform: it),
                  text: it.name,
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: allPlatforms
            .map(
              (it) => DevicePicker(
                platform: it,
              ),
            )
            .toList(),
      ),
    );
  }
}
