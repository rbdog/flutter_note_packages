import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_model/provider.dart';
import '../pages/pick_model.dart';
import 'minimal_tile.dart';

class PickModelNavigationTile extends ConsumerWidget {
  const PickModelNavigationTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(deviceModelProvider);

    return MinimalTile.navigation(
      title: Text(model.label.name),
      builder: (context) => const PickModelPage(),
    );
  }
}
