import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'id.dart';

part 'device_model.freezed.dart';

@freezed
abstract class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    required DeviceModelId id,
    required String name,
    @Default(null) EdgeInsets? rotatedSafeAreas,
    required EdgeInsets safeAreas,
    required Path screenPath,
    required double pixelRatio,
    required CustomPainter framePainter,
    required Size frameSize,
    required Size screenSize,
  }) = _DeviceModel;
}

extension DeviceModelExtension on DeviceModel {
  bool get canRotate => rotatedSafeAreas != null;

  bool isLandscape(Orientation orientation) {
    return canRotate && orientation == Orientation.landscape;
  }
}
