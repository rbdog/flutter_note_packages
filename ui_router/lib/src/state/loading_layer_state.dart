//
//
//

import 'package:ui_router/src/state/loading_state.dart';

class UiLoadingLayerState {
  UiLoadingLayerState({
    required this.queue,
  });
  final List<UiLoadingState> queue;
}
