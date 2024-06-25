import 'dart:typed_data';
import 'dart:ui' as ui;

import 'device/types/device.dart';

/// A screenshot from a preview.
class DeviceScreenshot {
  const DeviceScreenshot({
    required this.device,
    required this.bytes,
    required this.format,
  });

  /// The device from which the screenshot was taken from.
  final Device device;

  /// The binary content of the resulting image file.
  final Uint8List bytes;

  /// The format in which image bytes should be returned when using.
  final ui.ImageByteFormat format;
}
