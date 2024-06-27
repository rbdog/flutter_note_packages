import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/device_settings/provider.dart';
import 'locale_inherited_widget.dart';

class LocaleUpdatedShell extends ConsumerWidget {
  const LocaleUpdatedShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return LocaleInheritedWidget(
      locale: locale,
      child: child,
    );
  }
}
