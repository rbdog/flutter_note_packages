import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_settings/provider.dart';
import 'locale_inherited.dart';

class LocaleObserver extends ConsumerWidget {
  const LocaleObserver({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return LocaleInherited(
      locale: locale,
      child: child,
    );
  }
}
