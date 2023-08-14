//
//
//

import 'package:flutter/material.dart';

class UiDrawerNotifier {
  UiDrawerNotifier({
    required this.drawer,
  });

  final Widget Function()? drawer;

  /// isOpen
  final ValueNotifier<bool> state = ValueNotifier(false);

  /// reset all state
  void reset() {
    state.value = false;
  }

  /// drawer in
  void slideIn() {
    state.value = true;
  }

  /// drawer out
  void slideOut() {
    state.value = false;
  }
}
