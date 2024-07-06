import 'package:flutter/material.dart';

import '../../logic/device_model/types/index.dart';

class PlatformIcon extends StatelessWidget {
  const PlatformIcon({
    super.key,
    required this.platform,
  });

  final SoftwarePlatform platform;

  @override
  Widget build(BuildContext context) {
    return switch (platform) {
      SoftwarePlatform.ios => const Icon(Icons.phone_iphone),
      SoftwarePlatform.android => const Icon(Icons.phone_android),
      SoftwarePlatform.fantasy => const Icon(Icons.catching_pokemon),
    };
  }
}
