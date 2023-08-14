//
//
//

import 'package:flutter/material.dart';
import 'package:ui_router/src/config/tab_shell_config.dart';
import 'package:ui_router/src/route/tab_page.dart';
import 'package:ui_router/src/state/tab_shell_state.dart';

/// Router for Tab Pages
class UiTabShellNotifier {
  UiTabShellNotifier._({
    required this.config,
    required this.pages,
    required this.state,
  });

  final ValueNotifier<UiTabShellState> state;
  final UiTabShellConfig config;
  final List<UiTabPage> pages;

  factory UiTabShellNotifier({
    required UiTabShellConfig config,
    required List<UiTabPage> pages,
  }) {
    final paths = pages.map((e) => e.path).toList();
    final state = UiTabShellState(
      path: config.path,
      selected: paths.first,
      pathParams: {},
      queryParams: {},
    );
    return UiTabShellNotifier._(
      config: config,
      pages: pages,
      state: ValueNotifier(state),
    );
  }

  /// Tab Page ID
  String get selectedPath => state.value.selected;

  /// selected index
  int get selectedIndex {
    final pathes = pages.map((e) => e.path).toList();
    final index = pathes.indexWhere(
      (e) => e == selectedPath,
    );
    return index;
  }

  /// Switch Tab
  void select(String path) {
    if (state.value.selected == path) {
      // already selected
      return;
    }
    state.value = state.value.copyWith(
      selected: path,
    );
  }

  /// Switch Tab by index
  void selectIndex(int index) {
    final paths = pages.map((e) => e.path).toList();
    final path = paths[index];
    select(path);
  }
}
