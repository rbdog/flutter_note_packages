import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import '../../view/widgets/screenshot_rect.dart';
import 'types/screenshot.dart';

Future<Screenshot> takeScreenshot({
  required double pixelRatio,
}) async {
  final boundary =
      screenshotKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  const pngFormat = ui.ImageByteFormat.png;

  final image = await boundary.toImage(
    pixelRatio: pixelRatio,
  );
  final pngByteData = await image.toByteData(
    format: pngFormat,
  );
  final pngBytes = pngByteData!.buffer.asUint8List();
  final screenshot = Screenshot(
    bytes: pngBytes,
    format: pngFormat,
  );
  return screenshot;
}
