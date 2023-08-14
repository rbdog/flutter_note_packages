import 'package:flutter/foundation.dart';
import 'package:ui_router/src/config/config.dart';
import 'package:ui_router/src/config/nav_shell_config.dart';
import 'package:ui_router/src/config/tab_shell_config.dart';
import 'package:ui_router/src/route/route.dart';
import 'package:ui_router/src/state/nav_shell_state.dart';
import 'package:ui_router/src/state/state.dart';
import 'package:ui_router/src/state/page_state.dart';
import 'package:ui_router/src/state/tab_shell_state.dart';

UiState stateFromLri({
  required UiNavShellConfig inConfig,
  required String pattetn,
  required Map<String, String> pathParams,
  required Map<String, String> queryParams,
}) {
  debugPrint(
    'creating state for pattern=$pattetn in=${inConfig.fullPath}',
  );

  final names = pattetn.split('/');
  names.remove('');

  final nameIndexes = List<int>.generate(
    names.length,
    (index) => index,
  );

  String tmpPath = '';
  UiNavShellConfig tmpShellConfig = inConfig;
  final List<UiConfig> tmpConfigs = [];

  for (var nameIndex in nameIndexes) {
    final name = names[nameIndex];
    tmpPath += '/$name';

    // 探してみる
    final configIndex = tmpShellConfig.pages.indexWhere(
      (it) => it.path == tmpPath,
    );

    // 見つからなかった
    if (configIndex < 0) {
      continue;
    }

    // 見つかった
    final found = tmpShellConfig.pages[configIndex];
    tmpConfigs.add(found);

    // パスをリセット
    tmpPath = '';
  }

  var shouldLoop = true;
  while (shouldLoop) {
    // Leaf を補う
    switch (tmpConfigs.last.routeType) {
      case UiRouteType.page:
        // 補う必要なし
        shouldLoop = false;
        break;
      case UiRouteType.navShell:
        final internal = tmpConfigs.last as UiNavShellConfig;
        final leaf = internal.pages.firstWhere(
          (it) => it.path == internal.initialPagePath,
        );
        tmpConfigs.add(leaf);
        break;
      case UiRouteType.tabShell:
        final internal = tmpConfigs.last as UiTabShellConfig;
        final leaf = internal.tabs.firstWhere(
          (it) => it.path == internal.initialTabPath,
        );
        tmpConfigs.add(leaf);
        break;
    }
  }

  // configs --> state
  final state = _combineConfigsAsState(
    tmpConfigs,
    pathParams,
    queryParams,
  );
  return state;
}

// [shell, shell, page] の並びを state へ組み立てる
UiState _combineConfigsAsState(
  List<UiConfig> configs,
  Map<String, String> pathParams,
  Map<String, String> queryParams,
) {
  final reversedConfigs = configs.reversed.toList();
  final logConfigs = reversedConfigs.map((it) => it.path).toList();
  debugPrint('reversedConfigs=$logConfigs');

  UiState? tmpState;
  for (var config in reversedConfigs) {
    switch (config.routeType) {
      case UiRouteType.page:
        if (tmpState != null) {
          // [..., page, ...] のように並んでいた
          throw Exception('Page must be a leaf');
        }
        tmpState = UiPageState(
          path: config.path,
          pathParams: pathParams,
          queryParams: queryParams,
        );
        break;
      case UiRouteType.navShell:
        if (tmpState == null) {
          // [..., ..., shell] のように並んでいた
          throw Exception('NavShell cannot be a leaf');
        }
        tmpState = UiNavShellState(
          path: config.path,
          pathParams: pathParams,
          queryParams: queryParams,
          stack: [
            tmpState,
          ],
        );
        break;
      case UiRouteType.tabShell:
        if (tmpState == null) {
          // [..., ..., shell] のように並んでいた
          throw Exception('TabShell cannot be a leaf');
        }
        tmpState = UiTabShellState(
          path: config.path,
          pathParams: pathParams,
          queryParams: queryParams,
          selected: tmpState.path,
        );
        break;
    }
  }
  return tmpState!;
}
