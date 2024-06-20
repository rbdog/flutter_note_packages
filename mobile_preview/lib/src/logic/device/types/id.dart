import 'package:flutter/foundation.dart';

/// A unique identifier that represents a device.
///
/// See also :
///
/// * [loadDeviceInfo] to load information store in assets.
/// * [DeviceFrame] to display the frame associated to one of identifiers.
class DeviceId {
  /// Private constructor.
  const DeviceId(
    this.platform,
    this.name,
  );

  /// The unique name of the device (preferably in snake case).
  final String name;

  /// The target platform supported by this device.
  final TargetPlatform platform;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DeviceId && other.name == name && other.platform == platform);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode ^ platform.hashCode;

  @override
  String toString() {
    final platformKey =
        platform.toString().replaceAll('$TargetPlatform.', '').toLowerCase();
    return '${platformKey}_$name';
  }
}
