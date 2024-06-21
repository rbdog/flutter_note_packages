import 'package:flutter/material.dart';

class ScreenClipper extends CustomClipper<Path> {
  const ScreenClipper(this.path);

  final Path? path;

  @override
  Path getClip(Size size) {
    final path = (this.path ?? (Path()..addRect(Offset.zero & size)));
    final bounds = path.getBounds();
    var transform = Matrix4.translationValues(-bounds.left, -bounds.top, 0);

    return path.transform(transform.storage);
  }

  @override
  bool shouldReclip(ScreenClipper oldClipper) {
    return oldClipper.path != path;
  }
}
