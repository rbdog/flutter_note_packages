import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image/image.dart' as img_lib;
import 'package:pixel_color_image/src/pixel_color_preview.dart';

GlobalKey _globalKey = GlobalKey();

class PixelColorImage extends StatefulWidget {
  // RowData
  final Uint8List imageBytes;
  // Cache
  final img_lib.Image image;
  // Delegate
  final void Function(int x, int y, Color color)? onHover;
  final void Function(int x, int y, Color color)? onTap;
  final Widget Function(BuildContext context, Image image)? buildImage;
  // ref
  final PixelColorRef? ref;
  PixelColorImage({
    Key? key,
    required this.imageBytes,
    this.onHover,
    this.onTap,
    this.buildImage,
    this.ref,
  })  : image = img_lib.decodeImage(imageBytes)!,
        super(key: (() {
          if (key is GlobalKey) {
            // if parent key is global
            return key;
          } else {
            // new globalkey
            return _globalKey;
          }
        })());

  @override
  PixelColorImageState createState() => PixelColorImageState();
}

class _Params {
  int x;
  int y;
  Color color;
  _Params({
    required this.x,
    required this.y,
    required this.color,
  });
}

class PixelColorImageState extends State<PixelColorImage> {
  /// cache of calc parameters
  double _wRatio = 1;
  double _hRatio = 1;
  Size widgetSize = const Size(0, 0);

  int abgrToArgb(int argbColor) {
    int r = (argbColor >> 16) & 0xFF;
    int b = argbColor & 0xFF;
    return (argbColor & 0xFF00FF00) | (b << 16) | r;
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  // ignore: library_private_types_in_public_api
  _Params calcParams(double dx, double dy) {
    final x = dx;
    final y = dy;
    final pixelX = (x * _wRatio).round();
    final pixelY = (y * _hRatio).round();
    final pixel = widget.image.getPixel(pixelX, pixelY);
    final color = Color.fromARGB(
      pixel.a.toInt(),
      pixel.r.toInt(),
      pixel.g.toInt(),
      pixel.b.toInt(),
    );
    return _Params(x: pixelX, y: pixelY, color: color);
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        // on finish build
        widgetSize = (widget.key as GlobalKey).currentContext!.size!;
        final displayedW = widgetSize.width;
        final displayedH = widgetSize.height;
        final pixelW = widget.image.width;
        final pixelH = widget.image.height;
        _hRatio = pixelH / displayedH;
        _wRatio = pixelW / displayedW;
      });
    });
    return MouseRegion(
      onHover: (details) {
        final dx = details.localPosition.dx;
        final dy = details.localPosition.dy;
        final params = calcParams(dx, dy);
        widget.onHover?.call(params.x, params.y, params.color);
        if (widget.ref?.isUpdating ?? false) {
          widget.ref?.setPreviewColor(params.color);
        }
      },
      child: GestureDetector(
        onTapUp: (details) {
          final dx = details.localPosition.dx;
          final dy = details.localPosition.dy;
          final params = calcParams(dx, dy);
          widget.onTap?.call(params.x, params.y, params.color);
          if (widget.ref?.isUpdating ?? false) {
            widget.ref?.setPreviewColor(params.color);
          }
        },
        child: widget.buildImage?.call(
              context,
              Image.memory(widget.imageBytes),
            ) ??
            Image.memory(widget.imageBytes),
      ),
    );
  }
}
