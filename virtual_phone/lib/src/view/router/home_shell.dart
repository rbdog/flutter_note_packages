import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:virtual_phone/src/view/widgets/menu.dart';

import '../../logic/config/types/config.dart';

import 'device_container_page.dart';

/// HomeShell
class HomeShell extends ConsumerWidget {
  const HomeShell({
    super.key,
    this.config,
    required this.app,
  });

  /// The previewed widget.
  final Widget app;

  /// The default selected device for the first time.
  final Config? config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: DeviceContainerPage(
              app: app,
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
