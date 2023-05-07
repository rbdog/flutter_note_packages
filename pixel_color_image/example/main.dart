import 'package:flutter/material.dart';
import 'package:pixel_color_image/pixel_color_image.dart';

/// Called while Hoverring
void onHover(int x, int y, Color color) async {
  debugPrint('Hover x: $x, y: $y, color: $color');
}

/// Called when tap
void onTap(int x, int y, Color color) async {
  debugPrint('Tap x: $x, y: $y, color: $color');
}

/// Refarence for Preview
final ref = PixelColorRef();

/// main
void main() async {
  // Image
  final pixelColorImage = PixelColor.assetImage(
    path: 'images/xxx.png',
    onHover: onHover,
    onTap: onTap,
    ref: ref,
  );

  //
  // connect preview by "ref"
  //

  // Color Preview
  final pixelColorPreview = PixelColorPreview(
    ref: ref,
  );

  // App
  final app = MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          pixelColorPreview, // color preview
          pixelColorImage, // image
        ],
      ),
    ),
  );

  // Run App
  runApp(app);
}
