import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_model/provider.dart';
import '../widgets/device.dart';

class DeviceContainerPage extends ConsumerWidget {
  const DeviceContainerPage({
    super.key,
    required this.app,
  });

  final Widget app;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceModel = ref.watch(deviceModelProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/grid-square.png',
            package: 'virtual_phone',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: DeviceView(
            model: deviceModel,
            app: app,
          ),
        ),
      ],
    );
  }
}
