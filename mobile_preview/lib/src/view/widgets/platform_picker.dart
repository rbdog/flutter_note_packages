import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_preview/src/view/widgets/platform_icon.dart';
import 'package:flutter/material.dart';

import '../../logic/device/config.dart';
import 'device_picker.dart';

/// A page for picking a simulated device model.
class PlatformPicker extends HookWidget {
  const PlatformPicker({
    super.key,
    required this.platform,
  });

  final TargetPlatform platform;

  @override
  Widget build(BuildContext context) {
    final TabController tabController = useTabController(
      initialLength: allPlatforms.length,
      initialIndex: () {
        return allPlatforms.indexOf(platform);
      }(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Device'),
        bottom: TabBar(
          controller: tabController,
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
        controller: tabController,
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
