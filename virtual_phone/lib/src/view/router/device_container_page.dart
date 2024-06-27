import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:virtual_phone/src/state/device_model/provider.dart';
import 'package:virtual_phone/src/view/widgets/device_view.dart';

class DeviceContainerPage extends ConsumerWidget {
  const DeviceContainerPage({
    super.key,
    required this.screenshotKey,
    required this.child,
  });

  final GlobalKey screenshotKey;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceModel = ref.watch(deviceModelProvider);

    final mediaQuery = MediaQuery.of(context);

    return Container(
      color: Colors.grey,
      padding: EdgeInsets.only(
        top: 20 + mediaQuery.viewPadding.top,
        right: 20 + mediaQuery.viewPadding.right,
        left: 20 + mediaQuery.viewPadding.left,
        bottom: 20,
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: RepaintBoundary(
          key: screenshotKey,
          child: DeviceView(
            deviceModel: deviceModel,
            child: child,
          ),
        ),
      ),
    );
  }
}
