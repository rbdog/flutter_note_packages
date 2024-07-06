import 'hardware_screen.dart';
import 'model_label.dart';
import 'software_os.dart';

class DeviceModel {
  const DeviceModel({
    required this.id,
    required this.label,
    required this.hardwareImageUri,
    required this.hardwareScreen,
    required this.os,
  });

  final String id;
  final ModelLabel label;
  final String hardwareImageUri;
  final HardwareScreen hardwareScreen;
  final SoftwareOS os;
}
