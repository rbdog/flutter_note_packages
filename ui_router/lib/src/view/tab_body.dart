//
//
//

import 'package:ui_router/src/notifier/tab_shell_notifier.dart';
import 'package:flutter/material.dart';

class UiTabBody extends StatefulWidget {
  const UiTabBody(
    this.notifier, {
    super.key,
  });

  final UiTabShellNotifier notifier;

  @override
  State<UiTabBody> createState() => _UiTabBodyState();
}

class _UiTabBodyState extends State<UiTabBody> {
  late final PageController controller;
  UiTabShellNotifier get notifier => widget.notifier;
  var animatingCount = 0;

  @override
  void initState() {
    super.initState();
    final index = notifier.selectedIndex;
    controller = PageController(initialPage: index);
    notifier.state.addListener(updateState);
  }

  @override
  void dispose() {
    notifier.state.removeListener(updateState);
    controller.dispose();
    super.dispose();
  }

  void updateState() async {
    setState(() {
      animatingCount += 1;
    });
    await controller.animateToPage(
      notifier.selectedIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    setState(() {
      animatingCount -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageView = PageView.builder(
      controller: controller,
      itemCount: notifier.pages.length,
      itemBuilder: (context, index) {
        final tabPage = notifier.pages[index];
        return tabPage.body.call(notifier.state.value);
      },
      onPageChanged: (index) {
        // onPageChanged is unexpectedly called during animation with animateToPage
        // https://github.com/flutter/flutter/issues/43813
        // if use flag, multi animation is not controlled

        if (animatingCount == 0) {
          notifier.selectIndex(index);
        }
      },
    );

    return Expanded(
      child: pageView,
    );
  }
}
