import 'package:flutter/material.dart';

/// Refarence for the Preview
class PixelColorRef {
  // To be set from the state
  void Function(Color color)? _setPreviewColor;

  /// updating or not
  bool isUpdating = true;

  /// change preview color
  setPreviewColor(Color color) {
    if (isUpdating) {
      _setPreviewColor?.call(color);
    }
  }
}

/// Preview of the color
class PixelColorPreview extends StatefulWidget {
  /// ref
  final PixelColorRef ref;

  /// defaultColor
  final Color defaultColor;

  /// constructor
  const PixelColorPreview({
    super.key,
    required this.ref,
    this.defaultColor = Colors.grey,
  });

  @override
  State<PixelColorPreview> createState() => _PixelColorPreviewState();
}

class _PixelColorPreviewState extends State<PixelColorPreview> {
  Color? color;

  setPreviewColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  void dispose() {
    widget.ref._setPreviewColor = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.ref._setPreviewColor = setPreviewColor;
    return Container(
        width: 100, height: 100, color: color ?? widget.defaultColor);
  }
}
