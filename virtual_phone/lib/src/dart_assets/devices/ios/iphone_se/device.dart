import 'package:flutter/material.dart';

import '../../../../logic/device_model/types/device_model.dart';

part 'frame.g.dart';
part 'screen.g.dart';

final model = DeviceModel(
  id: 'iphone-se',
  platform: TargetPlatform.iOS,
  name: 'iPhone SE',
  pixelRatio: 2.0,
  frameSize: const Size(891.0, 1790.0),
  screenSize: const Size(375.0, 667.0),
  safeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 20.0,
    right: 0.0,
    bottom: 0.0,
  ),
  rotatedSafeAreas: const EdgeInsets.only(
    left: 0.0,
    top: 20.0,
    right: 0.0,
    bottom: 0.0,
  ),
  framePainter: const _FramePainter(),
  screenPath: _screenPath,
);
