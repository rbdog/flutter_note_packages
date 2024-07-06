import 'package:flutter/material.dart';

class LocaleInherited extends InheritedWidget {
  const LocaleInherited({
    super.key,
    required this.locale,
    required super.child,
  });

  final Locale? locale;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is LocaleInherited) {
      return oldWidget.locale != locale;
    }
    return true;
  }
}
