import 'package:flutter/foundation.dart';
import 'package:ui_router/src/config/nav_shell_config.dart';
import 'package:ui_router/src/state/state.dart';
import 'package:ui_router/src/updater/decode_uri.dart';
import 'package:ui_router/src/updater/get_all_patterns.dart';
import 'package:ui_router/src/updater/state_from_config.dart';
import 'package:ui_router/src/state/nav_shell_state.dart';

class UiNavShellUpdater {
  UiNavShellUpdater({
    required this.config,
    this.redirect,
  });

  final UiNavShellConfig config;
  final String? Function(UiState state)? redirect;

  UiNavShellState _getRedirected(UiNavShellState suggested) {
    final redirected = redirect?.call(suggested);
    if (redirected == null) {
      // そのまま通す
      return suggested;
    }
    debugPrint('redirecting to $redirected');
    final allPatterns = getAllPatternsFromList(configs: config.pages);
    final redirectedUri = decodeUri(redirected, allPatterns);
    if (redirectedUri == null) {
      throw Exception('invalid redirect uri=$redirected');
    }
    final initialChildState = stateFromLri(
      inConfig: config,
      pattetn: redirectedUri.pattern,
      pathParams: redirectedUri.pathParams,
      queryParams: redirectedUri.queryParams,
    );
    return UiNavShellState(
      stack: [initialChildState],
      path: config.path,
      queryParams: redirectedUri.pathParams,
      pathParams: redirectedUri.queryParams,
    );
  }

  UiNavShellState initState({
    required UiUri initialUri,
  }) {
    debugPrint(
      'initState this=${config.fullPath} initialChildUri=${initialUri.pattern}',
    );
    final initialChildState = stateFromLri(
      inConfig: config,
      pattetn: initialUri.pattern,
      pathParams: initialUri.pathParams,
      queryParams: initialUri.queryParams,
    );
    return UiNavShellState(
      stack: [initialChildState],
      path: config.path,
      pathParams: initialUri.pathParams,
      queryParams: initialUri.queryParams,
    );
  }

  UiNavShellState push(
    UiNavShellState oldState, {
    required String path,
    required Map<String, String> pathParams,
    required Map<String, String> queryParams,
  }) {
    final newPageState = stateFromLri(
      inConfig: config,
      pattetn: path,
      pathParams: pathParams,
      queryParams: queryParams,
    );
    final newState = oldState.copyWith(stack: [
      ...oldState.stack,
      newPageState,
    ]);
    final redirected = _getRedirected(newState);
    return redirected;
  }

  UiNavShellState pop(
    UiNavShellState oldState, {
    required bool Function(UiState state)? untilWhere,
  }) {
    // 処理本体
    int newLastIndex = oldState.stack.length - 2;
    if (untilWhere != null) {
      newLastIndex = oldState.stack.lastIndexWhere(
        (subState) {
          return untilWhere(subState);
        },
      );
    }
    if (newLastIndex < 0) {
      newLastIndex = 0;
    }
    debugPrint('poping on shellPath=${config.fullPath}');
    final newState = oldState.copyWith(
      stack: oldState.stack.sublist(0, newLastIndex + 1),
    );
    final redirected = _getRedirected(newState);
    return redirected;
  }

  UiNavShellState replace(
    UiNavShellState oldState, {
    required String path,
    required Map<String, String> pathParams,
    required Map<String, String> queryParams,
  }) {
    final uri = UiUri(
      pattern: path,
      pathParams: pathParams,
      queryParams: queryParams,
    );
    final newState = initState(initialUri: uri);
    final redirected = _getRedirected(newState);
    return redirected;
  }
}
