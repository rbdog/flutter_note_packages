import 'package:flutter/material.dart';

/// The repaint key used for rendering screenshots.
final screenshotKey = GlobalKey();

class ScreenshotRect extends StatelessWidget {
  const ScreenshotRect({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: screenshotKey,
      child: child,
    );
  }
}
