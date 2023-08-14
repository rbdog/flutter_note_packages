import 'package:ui_router/src/route/dialog.dart';
import 'package:ui_router/src/state/dialog_layer_state.dart';
import 'package:ui_router/src/state/dialog_state.dart';

class UiDialogLayerUpdater {
  UiDialogLayerUpdater({
    required this.dialogs,
  });

  final List<UiDialog> dialogs;

  UiDialogLayerState initState() {
    final initialState = UiDialogLayerState(queue: []);
    return initialState;
  }

  /// Open dialog
  UiDialogLayerState open(
    UiDialogLayerState oldState,
    UiDialogState state,
  ) {
    final newLayerState = UiDialogLayerState(
      queue: [...oldState.queue, state],
    );
    return newLayerState;
  }

  /// Close dialog
  UiDialogLayerState close(
    UiDialogLayerState oldState,
    String? name,
  ) {
    final index = oldState.queue.indexWhere(
      (subState) => subState.name == name,
    );
    oldState.queue[index].dispose();
    final newSubStates = oldState.queue..removeAt(index);
    final newLayerState = UiDialogLayerState(
      queue: newSubStates,
    );
    return newLayerState;
  }
}
