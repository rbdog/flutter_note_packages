import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import '../../view/router/home_shell.dart';
import '../device_model/types/device_model.dart';
import '../os_settings/types/os_settings.dart';
import 'types/screenshot.dart';

Future<DeviceScreenshot> screenshot(
  DeviceModel device,
  OSSettings settings,
) async {
  final boundary =
      screenshotKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  const format = ui.ImageByteFormat.png;

  final image = await boundary.toImage(
    pixelRatio: device.pixelRatio,
  );
  final byteData = await image.toByteData(
    format: format,
  );
  final bytes = byteData!.buffer.asUint8List();
  final screenshot = DeviceScreenshot(
    device: device,
    bytes: bytes,
    format: format,
  );
  return screenshot;
}
