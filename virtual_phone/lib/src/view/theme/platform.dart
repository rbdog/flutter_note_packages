import 'package:flutter/material.dart';

import '../../logic/device_model/types/index.dart' as logic;

TargetPlatform toFlutterPlatform(logic.SoftwarePlatform platform) {
  return switch (platform) {
    logic.SoftwarePlatform.ios => TargetPlatform.iOS,
    logic.SoftwarePlatform.android => TargetPlatform.android,
    logic.SoftwarePlatform.fantasy => TargetPlatform.android,
  };
}
