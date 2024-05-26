import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pixel_color_image/src/get_image_bytes_asset.dart';
import 'package:pixel_color_image/src/get_image_bytes_url.dart';
import 'package:pixel_color_image/src/pixel_color_image.dart';
import 'package:pixel_color_image/src/pixel_color_preview.dart';

/// PixelColor
class PixelColor extends StatelessWidget {
  /// assetPath
  final String? path;

  /// url
  final String? url;

  /* Delegate */
  /// onHover
  final void Function(int x, int y, Color color)? onHover;

  /// onTap
  final void Function(int x, int y, Color color)? onTap;

  /// buildImage
  final Widget Function(BuildContext context, Image image)? buildImage;

  /// ref
  final PixelColorRef? ref;

  /// from assets
  const PixelColor.assetImage({
    super.key,
    required this.path,
    this.onHover,
    this.onTap,
    this.buildImage,
    this.ref,
  }) : url = null;

  /// from network
  const PixelColor.networkImage({
    super.key,
    required this.url,
    this.onHover,
    this.onTap,
    this.buildImage,
    this.ref,
  }) : path = null;

  /// get image bytes
  Future<Uint8List> getBytes() async {
    if (path != null) {
      return await getImageBytesAsset(path!);
    }
    if (url != null) {
      return await getImageBytesUrl(url!);
    }
    throw Exception('required assetPath | url');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: getBytes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          if (!snapshot.hasData) {
            return const Text("Error: Not Found Image Data");
          }
          return PixelColorImage(
            imageBytes: snapshot.data!,
            onHover: onHover,
            onTap: onTap,
            buildImage: buildImage,
            ref: ref,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
