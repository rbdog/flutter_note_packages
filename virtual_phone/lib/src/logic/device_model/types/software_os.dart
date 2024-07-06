import 'software_platform.dart';

class SoftwareOS {
  const SoftwareOS({
    required this.platform,
    required this.keyboardHeight,
  });

  final SoftwarePlatform platform;
  final double keyboardHeight;
}
