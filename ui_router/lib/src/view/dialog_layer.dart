//
//
//

import 'package:flutter/material.dart';
import 'package:ui_router/src/notifier/dialog_notifier.dart';

class UiDialogLayer extends StatelessWidget {
  const UiDialogLayer({
    super.key,
    required this.notifier,
  });

  final UiDialogNotifier notifier;

  @override
  Widget build(BuildContext context) {
    if (notifier.state.value.queue.isEmpty) {
      return const SizedBox.shrink();
    }

    return Navigator(
      pages: [
        MaterialPage(
          child: PopScope(
            canPop: false,
            child: Scaffold(
              backgroundColor: Colors.black.withValues(alpha: 0.5),
              body: Center(
                child: SingleChildScrollView(
                  child: Builder(builder: (_) {
                    final dialogState = notifier.state.value.queue.first;
                    final builder = notifier.updater.dialogs.singleWhere(
                      (dialog) => dialog.name == dialogState.name,
                    );
                    return builder.build(dialogState);
                  }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
