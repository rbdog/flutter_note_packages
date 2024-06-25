import 'package:flutter/material.dart';

class LocaleInheritedWidget extends InheritedWidget {
  const LocaleInheritedWidget({
    super.key,
    required this.locale,
    required super.child,
  });

  final Locale? locale;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is LocaleInheritedWidget) {
      return oldWidget.locale != locale;
    }
    return true;
  }
}
