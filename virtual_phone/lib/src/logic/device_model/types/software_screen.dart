import 'software_safe_area_inset.dart';

class SoftwareScreen {
  const SoftwareScreen({
    required this.width,
    required this.height,
    required this.cornerRadius,
    required this.safeAreaInset,
  });

  final double width;
  final double height;
  final double cornerRadius;
  final SoftwareSafeAreaInset safeAreaInset;
}
