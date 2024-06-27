import 'dart:typed_data';
import 'dart:ui' as ui;

/// A screenshot from a preview.
class DeviceScreenshot {
  const DeviceScreenshot({
    required this.bytes,
    required this.format,
  });

  /// The binary content of the resulting image file.
  final Uint8List bytes;

  /// The format in which image bytes should be returned when using.
  final ui.ImageByteFormat format;
}
