import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:vector_math/vector_math_64.dart' show Vector2;
import 'package:ar_widget/src/arkit_widget.dart';
import 'package:ar_widget/src/arcore_widget.dart';
import 'package:ar_widget/src/common_widgets.dart';

/// ARWidget
class ARWidget extends StatelessWidget {
  const ARWidget({
    super.key,
    this.canvasWidth = 300,
    this.canvasHeight = 500,
    required this.child,
  });

  final double canvasWidth;
  final double canvasHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (_, constraints) {
          if (kIsWeb) {
            /* Web */
            return const NotSupported();
          }
          if (Platform.isIOS) {
            /* iOS */
            return ArkitWidget(
              key: key,
              size: Vector2(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
              canvasSize: Vector2(
                canvasWidth,
                canvasHeight,
              ),
              child: child,
            );
          } else if (Platform.isAndroid) {
            return const ArcoreWidget();
          } else {
            /* other platforms */
            return const NotSupported();
          }
        },
      ),
    );
  }
}
