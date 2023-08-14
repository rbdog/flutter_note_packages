//
//
//

import 'package:ui_router/src/route/loading.dart';
import 'package:ui_router/src/state/loading_layer_state.dart';
import 'package:flutter/material.dart';
import 'package:ui_router/src/state/loading_state.dart';

class UiLoadingNotifier {
  UiLoadingNotifier({
    required this.routes,
  });

  final List<UiLoading> routes;
  final ValueNotifier<UiLoadingLayerState> state = ValueNotifier(
    UiLoadingLayerState(queue: []),
  );

  /// Show loading with a task
  Future<void> loading({
    required String name,
    required Map<String, String> params,
    required Future<void> Function() task,
  }) async {
    final targetState = UiLoadingState(
      name: name,
      params: params,
    );
    final prevState = UiLoadingLayerState(
      queue: [...state.value.queue, targetState],
    );
    state.value = prevState;
    // await task action
    await task();
    final nextQueue = state.value.queue;
    nextQueue.removeWhere(
      (it) => it.name == name,
    );
    final nextState = UiLoadingLayerState(
      queue: nextQueue,
    );
    state.value = nextState;
  }
}
