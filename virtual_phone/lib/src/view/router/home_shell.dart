import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:virtual_phone/src/view/widgets/menu.dart';

import '../../dart_assets/devices/index.dart';
import '../../logic/device_model/types/id.dart';
import '../../logic/config/types/config.dart';

import 'device_container_page.dart';

/// HomeShell
class HomeShell extends ConsumerWidget {
  const HomeShell({
    super.key,
    this.config,
    required this.child,
  });

  /// The previewed widget.
  final Widget child;

  /// The default selected device for the first time.
  final Config? config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: DeviceContainerPage(
              screenshotKey: screenshotKey,
              child: child,
            ),
          ),
          const SizedBox(
            width: 320,
            child: Menu(),
          ),
        ],
      ),
    );
  }
}

// final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

/// The repaint key used for rendering screenshots.
final screenshotKey = GlobalKey();

/// The list of all available device identifiers.
List<DeviceModelId> availableDeviceIds() {
  return Devices.all.map((it) => it.id).toList();
}
