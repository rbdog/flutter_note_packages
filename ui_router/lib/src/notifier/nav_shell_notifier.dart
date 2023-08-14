import 'package:flutter/material.dart';
import 'package:ui_router/src/state/nav_shell_state.dart';
import 'package:ui_router/src/state/state.dart';
import 'package:ui_router/src/updater/nav_shell_updater.dart';

class UiNavShellNotifier {
  const UiNavShellNotifier._({
    required this.state,
    required this.updater,
  });

  final ValueNotifier<UiNavShellState> state;
  final UiNavShellUpdater updater;

  factory UiNavShellNotifier({
    required UiNavShellState state,
    required UiNavShellUpdater updater,
  }) {
    return UiNavShellNotifier._(
      state: ValueNotifier(state),
      updater: updater,
    );
  }

  /// Go to the next page
  void push(
    String path, {
    required Map<String, String> pathParams,
    required Map<String, String> queryParams,
  }) {
    final newState = updater.push(
      state.value,
      path: path,
      pathParams: pathParams,
      queryParams: queryParams,
    );
    state.value = newState;
  }

  /// Back page (until: path)
  void pop({
    required bool Function(UiState state)? untilWhere,
  }) {
    final newState = updater.pop(
      state.value,
      untilWhere: untilWhere,
    );
    state.value = newState;
  }

  /// replace page stack
  void replace(
    String path, {
    required Map<String, String> pathParams,
    required Map<String, String> queryParams,
  }) {
    final newState = updater.replace(
      state.value,
      path: path,
      pathParams: pathParams,
      queryParams: queryParams,
    );
    state.value = newState;
  }
}
