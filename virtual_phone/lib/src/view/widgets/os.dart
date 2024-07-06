import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/device_model/types/index.dart';
import 'os_safe_area_shell.dart';
import 'os_setings_shell.dart';

/// Display a simulated on screen keyboard at the bottom of a [app] widget.
class OSView extends ConsumerWidget {
  const OSView({
    super.key,
    required this.screen,
    required this.os,
    required this.app,
  });

  final SoftwareOS os;
  final SoftwareScreen screen;
  final Widget app;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: OSSafeAreaShell(
        screen: screen,
        os: os,
        child: OSSettingsShell(
          os: os,
          child: app,
        ),
      ),
    );
  }
}
