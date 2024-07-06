import 'package:flutter/material.dart';

import '../src/view/router/config_inherited.dart';
import '../src/view/router/locale_inherited.dart';
import '../src/view/pages/home.dart';

abstract class VirtualPhone {
  static Locale? locale(
    BuildContext context,
  ) {
    final localeInheritedWidget =
        context.dependOnInheritedWidgetOfExactType<LocaleInherited>();
    return localeInheritedWidget?.locale;
  }

  static Widget builder(
    BuildContext context,
    Widget? child,
  ) {
    final configWidget =
        context.dependOnInheritedWidgetOfExactType<ConfigInherited>();
    return HomePage(
      config: configWidget?.config,
      app: child ?? const SizedBox.shrink(),
    );
  }
}
