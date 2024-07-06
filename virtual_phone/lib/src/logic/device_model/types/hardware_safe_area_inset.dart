import 'hardware_inset.dart';

class HardwareSafeAreaInset {
  const HardwareSafeAreaInset({
    required this.portrait,
    required this.landscape,
  });

  final HardwareInset portrait;
  final HardwareInset landscape;
}
