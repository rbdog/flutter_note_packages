import 'dart:typed_data';
import 'dart:ui' as ui;

import '../../device_model/types/device_model.dart';

/// A screenshot from a preview.
class DeviceScreenshot {
  const DeviceScreenshot({
    required this.device,
    required this.bytes,
    required this.format,
  });

  /// The device from which the screenshot was taken from.
  final DeviceModel device;

  /// The binary content of the resulting image file.
  final Uint8List bytes;

  /// The format in which image bytes should be returned when using.
  final ui.ImageByteFormat format;
}
