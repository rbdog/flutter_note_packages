import 'package:flutter/material.dart';

import 'config_inherited_widget.dart';
import 'locale_inherited_widget.dart';
import 'virtual_phone_shell.dart';

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
    return VirtualPhoneShell(
      config: configWidget?.config,
      child: child ?? const SizedBox.shrink(),
    );
  }
}
