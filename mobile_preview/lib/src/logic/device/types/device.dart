import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_preview/src/logic/device/types/id.dart';

part 'device.freezed.dart';

@freezed
abstract class Device with _$Device {
  const factory Device({
    required DeviceId id,
    required String name,
    @Default(null) EdgeInsets? rotatedSafeAreas,
    required EdgeInsets safeAreas,
    required Path screenPath,
    required double pixelRatio,
    required CustomPainter framePainter,
    required Size frameSize,
    required Size screenSize,
  }) = _Device;
}

extension DeviceExtension on Device {
  bool get canRotate => rotatedSafeAreas != null;

  bool isLandscape(Orientation orientation) {
    return canRotate && orientation == Orientation.landscape;
  }
}
