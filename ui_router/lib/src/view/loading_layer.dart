import 'package:ui_router/src/notifier/loading_notifier.dart';
import 'package:ui_router/src/state/loading_layer_state.dart';
import 'package:flutter/material.dart';

class UiLoadingLayer extends StatefulWidget {
  const UiLoadingLayer(
    this.notifier, {
    super.key,
  });

  final UiLoadingNotifier notifier;

  @override
  State<UiLoadingLayer> createState() => _UiLoadingLayerState();
}

/// UiNavRouteState
class _UiLoadingLayerState extends State<UiLoadingLayer> {
  late UiLoadingLayerState state;

  void updateState() {
    setState(() {
      state = widget.notifier.state.value;
    });
  }

  @override
  void initState() {
    super.initState();
    state = widget.notifier.state.value;
    widget.notifier.state.addListener(updateState);
  }

  @override
  void dispose() {
    widget.notifier.state.removeListener(updateState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return state.queue.isNotEmpty
        ? Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  alignment: Alignment.center,
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        : const Column(children: []);
  }
}
