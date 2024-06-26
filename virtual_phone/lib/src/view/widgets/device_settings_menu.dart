import 'package:flutter/material.dart';

/// The panel which contains all the tools.
class DeviceSettingsMenu extends StatelessWidget {
  const DeviceSettingsMenu({
    super.key,
    required this.slivers,
    this.isModal = false,
  });

  /// Indicates whether the panel is shown modally as a new page, or if it
  /// stays visible on one side of the parent layout.
  final bool isModal;

  /// The sections containing the tools.
  ///
  /// They must be [Sliver]s.
  final List<Widget> slivers;

  /// The panel width when not modal.
  static const double panelWidth = 320;

  @override
  Widget build(BuildContext context) {
    final rootContext = context;
    return Navigator(
      onGenerateInitialRoutes: (nav, name) {
        return [
          MaterialPageRoute(
            builder: (context) {
              return _ToolPanel(
                sections: slivers,
                isModal: isModal,
                onClose: () {
                  Navigator.maybePop(rootContext);
                },
              );
            },
          ),
        ];
      },
    );
  }
}

class _ToolPanel extends StatelessWidget {
  const _ToolPanel({
    required this.isModal,
    required this.onClose,
    required this.sections,
  });

  final bool isModal;
  final VoidCallback onClose;
  final List<Widget> sections;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Mobile preview',
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: isModal
            ? IconButton(
                icon: const Icon(Icons.close),
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                onPressed: onClose,
              )
            : null,
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: sections,
          ),
        ],
      ),
    );
  }
}
