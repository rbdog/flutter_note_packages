import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';

@freezed
abstract class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    required String id,
    required TargetPlatform platform,
    required String name,
    required EdgeInsets rotatedSafeAreas,
    required EdgeInsets safeAreas,
    required CustomPainter framePainter,
    required Size frameSize,
    required Path screenPath,
    required Size screenSize,
    required double pixelRatio,
  }) = _DeviceModel;
}
