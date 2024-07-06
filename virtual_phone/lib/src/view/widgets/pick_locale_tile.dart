import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../external/locales/locales.dart';
import '../../state/device_settings/provider.dart';
import 'minimal_tile.dart';

class PickLocaleTile extends ConsumerWidget {
  const PickLocaleTile({
    super.key,
    required this.locale,
  });

  final NamedLocale locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MinimalTile.tapAction(
      title: Text(
        locale.name,
        overflow: TextOverflow.ellipsis,
      ),
      icon: const SizedBox.shrink(),
      onTap: () {
        final notifier = ref.watch(deviceSettingsProvider.notifier);
        notifier.setLocale(locale);
      },
    );
  }
}
