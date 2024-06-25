import 'package:mobile_preview/src/view/router/config_inherited_widget.dart';
import 'package:mobile_preview/src/view/router/locale_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobile_preview/src/view/router/mobile_preview_shell.dart';

abstract class MobilePreview {
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
    final config =
        context.dependOnInheritedWidgetOfExactType<ConfigInheritedWidget>();
    return MobilePreviewShell(
      initialDevice: config?.initialDevice,
      child: child ?? const SizedBox.shrink(),
    );
  }
}
