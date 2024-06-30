import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';

import '../../logic/device_model/types/device_model.dart';
import 'model_picker.dart';
import 'platform_icon.dart';

/// A page for picking a simulated device model.
class PlatformPicker extends HookWidget {
  const PlatformPicker({
    super.key,
    required this.platform,
  });

  final Platform platform;

  @override
  Widget build(BuildContext context) {
    final TabController tabController = useTabController(
      initialLength: Platform.values.length,
      initialIndex: () {
        return Platform.values.indexOf(platform);
      }(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Platforms'),
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: Platform.values
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
        children: Platform.values
            .map(
              (it) => ModelPicker(
                platform: it,
              ),
            )
            .toList(),
      ),
    );
  }
}
