import 'hardware_safe_area_inset.dart';
import 'ratio_position.dart';

class HardwareScreen {
  const HardwareScreen({
    required this.position,
    required this.logicalWidth,
    required this.logicalHeight,
    required this.logicalCornerRadius,
    required this.pixelRatio,
    required this.safeAreaInset,
  });

  final RatioPosition position;
  final double logicalWidth;
  final double logicalHeight;
  final double logicalCornerRadius;
  final double pixelRatio;
  final HardwareSafeAreaInset safeAreaInset;
}
