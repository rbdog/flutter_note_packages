import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:virtual_phone/src/view/widgets/os_safe_area_shell.dart';
import 'package:virtual_phone/src/view/widgets/os_setings_shell.dart';

import '../../logic/device_model/types/device_model.dart';

/// Display a simulated on screen keyboard at the bottom of a [app] widget.
class OSView extends ConsumerWidget {
  const OSView({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.os,
    required this.app,
  });

  final OS os;
  final double screenWidth;
  final double screenHeight;
  final Widget app;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: OSSafeAreaShell(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        os: os,
        child: OSSettingsShell(
          os: os,
          child: app,
        ),
      ),
    );
  }
}
