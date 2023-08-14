import 'package:flutter/material.dart';
import 'package:ui_router/src/route/dialog.dart';
import 'package:ui_router/src/state/dialog_answer.dart';
import 'package:ui_router/src/state/dialog_layer_state.dart';
import 'package:ui_router/src/state/dialog_state.dart';
import 'package:ui_router/src/updater/dialog_layer_updater.dart';

class UiDialogNotifier {
  const UiDialogNotifier._({
    required this.state,
    required this.updater,
  });

  final ValueNotifier<UiDialogLayerState> state;
  final UiDialogLayerUpdater updater;

  factory UiDialogNotifier({
    required List<UiDialog> dialogs,
  }) {
    final updater = UiDialogLayerUpdater(
      dialogs: dialogs,
    );
    final iniState = updater.initState();
    final valueNotif = ValueNotifier(iniState);
    return UiDialogNotifier._(
      state: valueNotif,
      updater: updater,
    );
  }

  /// Open dialog
  Future<UiAnswer> open(
    String name, {
    required Map<String, String> params,
    required void Function(String? value)? onEvent,
  }) {
    final dialogState = UiDialogState(name: name, params: params);
    final newState = updater.open(state.value, dialogState);
    state.value = newState;
    if (onEvent != null) {
      dialogState.receiveEvent(onEvent);
    }
    return dialogState.receiveAnswer();
  }

  /// Close dialog
  void close({required String? name}) {
    final newState = updater.close(state.value, name);
    state.value = newState;
  }
}
