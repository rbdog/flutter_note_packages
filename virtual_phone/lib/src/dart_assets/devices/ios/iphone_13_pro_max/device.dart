import 'package:flutter/material.dart';

import '../../../../logic/device_model/types/device_model.dart';
import '../../../../logic/device_model/types/id.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final info = DeviceModel(
  id: const DeviceModelId(
    TargetPlatform.iOS,
    'iphone-13-pro-max',
  ),
  name: 'iPhone 13 Pro Max',
  pixelRatio: 3.0,
  frameSize: const Size(873.0, 1770.0),
  screenSize: const Size(428.0, 926.0),
  safeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 47.0,
    right: 0.0,
    bottom: 34.0,
  ),
  rotatedSafeAreas: const EdgeInsets.only(
    left: 47.0,
    top: 0.0,
    right: 47.0,
    bottom: 21.0,
  ),
  framePainter: const _FramePainter(),
  screenPath: _screenPath,
);