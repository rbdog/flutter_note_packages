import 'package:flutter/material.dart';

import '../../logic/device_model/types/device_model.dart' as logic;

TargetPlatform toFlutterPlatform(logic.Platform platform) {
  return switch (platform) {
    logic.Platform.ios => TargetPlatform.iOS,
    logic.Platform.android => TargetPlatform.android,
  };
}
