import 'package:ui_router/src/notifier/dialog_notifier.dart';
import 'package:ui_router/src/notifier/nav_shell_notifier.dart';
import 'package:ui_router/src/notifier/tab_shell_notifier.dart';
import 'package:ui_router/src/route/dialog.dart';
import 'package:ui_router/src/route/shell.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/router/theme_from_route.dart';
import 'package:ui_router/src/state/dialog_answer.dart';
import 'package:ui_router/src/state/state.dart';
import 'package:ui_router/src/theme/nav_shell_theme.dart';
import 'package:ui_router/src/updater/create_all_nav_notifiers.dart';
import 'package:ui_router/src/updater/create_all_tab_notifiers.dart';

class UiRouter {
  const UiRouter._({
    required this.navShellNotifiers,
    required this.tabShellNotifiers,
    required this.dialogNotifier,
    required this.shellPath,
    required this.rootTheme,
  });

  final List<UiNavShellNotifier> navShellNotifiers;
  final List<UiTabShellNotifier> tabShellNotifiers;
  final UiDialogNotifier dialogNotifier;
  final String shellPath;
  final UiNavShellTheme rootTheme;

  factory UiRouter({
    // Pages
    required List<UiRoute> pages,
    // Dialogs
    List<UiDialog> dialogs = const [],
    // Redirect returns URI
    String? Function(UiState state)? redirect,
  }) {
    final rootShell = UiShell.root(
      pages: pages,
    );
    final theme = themeFromRoute(rootShell) as UiNavShellTheme;
    final dialogNotifier = UiDialogNotifier(
      dialogs: dialogs,
    );
    final navShellNotifiers = createAllNavNotifiers(rootShell, redirect);
    final tabShellNotifiers = createAllTabNotifiers(rootShell, redirect);
    return UiRouter._(
      shellPath: rootShell.path,
      rootTheme: theme,
      navShellNotifiers: navShellNotifiers,
      tabShellNotifiers: tabShellNotifiers,
      dialogNotifier: dialogNotifier,
    );
  }

  UiNavShellNotifier getNavShellNotifier(String shellPath) {
    final foundIndex = navShellNotifiers.indexWhere(
      (it) => it.updater.config.fullPath == shellPath,
    );
    if (foundIndex < 0) {
      throw Exception('Notifier not found for shellPath=$shellPath');
    }
    return navShellNotifiers[foundIndex];
  }

  UiTabShellNotifier getTabShellNotifier(String shellPath) {
    final foundIndex = tabShellNotifiers.indexWhere(
      (it) => it.config.fullPath == shellPath,
    );
    if (foundIndex < 0) {
      throw Exception('TabShellNotifier not found for shellPath=$shellPath');
    }
    return tabShellNotifiers[foundIndex];
  }

  /// Go to the next page
  void push(
    String path, {
    Map<String, String> pathParams = const {},
    Map<String, String> queryParams = const {},
  }) {
    final notifier = getNavShellNotifier(shellPath);
    notifier.push(
      path,
      pathParams: pathParams,
      queryParams: queryParams,
    );
  }

  /// Back page (until: path)
  void pop({
    bool Function(UiState state)? untilWhere,
  }) {
    final notifier = getNavShellNotifier(shellPath);
    notifier.pop(untilWhere: untilWhere);
  }

  /// replace page stack
  void replace(
    String path, {
    Map<String, String> pathParams = const {},
    Map<String, String> queryParams = const {},
  }) {
    final notifier = getNavShellNotifier(shellPath);
    notifier.replace(
      path,
      pathParams: pathParams,
      queryParams: queryParams,
    );
  }

  /// Router for shell
  UiRouter shell(String shellPath) {
    return UiRouter._(
      navShellNotifiers: navShellNotifiers,
      tabShellNotifiers: tabShellNotifiers,
      dialogNotifier: dialogNotifier,
      rootTheme: rootTheme,
      shellPath: shellPath,
    );
  }

  /// Open dialog
  Future<UiAnswer> openDialog(
    String name, {
    Map<String, String> params = const {},
    void Function(String? value)? onEvent,
  }) {
    return dialogNotifier.open(
      name,
      params: params,
      onEvent: onEvent,
    );
  }

  /// Close dialog
  void closeDialog({String? name}) {
    dialogNotifier.close(name: name);
  }
}
