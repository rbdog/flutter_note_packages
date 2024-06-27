import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import '../../view/widgets/screenshot_view.dart';
import 'types/screenshot.dart';

Future<DeviceScreenshot> takeAScreenshot({
  required double pixelRatio,
}) async {
  final boundary =
      screenshotKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  const format = ui.ImageByteFormat.png;

  final image = await boundary.toImage(
    pixelRatio: pixelRatio,
  );
  final byteData = await image.toByteData(
    format: format,
  );
  final bytes = byteData!.buffer.asUint8List();
  final screenshot = DeviceScreenshot(
    bytes: bytes,
    format: format,
  );
  return screenshot;
}
