import 'package:flutter/material.dart';

import '../src/view/router/config_inherited_widget.dart';
import '../src/view/router/locale_inherited_widget.dart';
import '../src/view/router/home_shell.dart';

abstract class VirtualPhone {
  static Locale? locale(
    BuildContext context,
  ) {
    final localeInheritedWidget =
        context.dependOnInheritedWidgetOfExactType<LocaleInheritedWidget>();
    return localeInheritedWidget?.locale;
  }

  static Widget builder(
    BuildContext context,
    Widget? child,
  ) {
    final configWidget =
        context.dependOnInheritedWidgetOfExactType<ConfigInheritedWidget>();
    return HomeShell(
      config: configWidget?.config,
      child: child ?? const SizedBox.shrink(),
    );
  }
}
