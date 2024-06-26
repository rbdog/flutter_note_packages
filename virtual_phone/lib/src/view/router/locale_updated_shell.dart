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
    final asyncLocale = ref.watch(localeProvider);
    switch (asyncLocale) {
      case AsyncData(value: final locale):
        return LocaleInheritedWidget(
          locale: locale,
          child: child,
        );
      case AsyncError(:final error):
        throw error;
      default:
        return const MaterialApp(
          home: HeroControllerScope.none(
            child: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
    }
  }
}
