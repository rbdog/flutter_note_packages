import 'package:flutter/material.dart';
import 'package:mobile_preview/src/view/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../state/models.dart';
import '../../state/store.dart';
import 'section.dart';

/// All the settings for customizing the preview.
class SettingsSection extends StatelessWidget {
  /// Create a new menu section with settings for customizing the preview.
  ///
  /// The items can be hidden with [backgroundTheme], [toolsTheme] parameters.
  const SettingsSection({
    super.key,
    this.backgroundTheme = true,
    this.toolsTheme = true,
  });

  /// Allow to edit the current background theme.
  final bool backgroundTheme;

  /// Allow to edit the current toolbar theme.
  final bool toolsTheme;

  @override
  Widget build(BuildContext context) {
    final backgroundTheme = context.select(
      (MobilePreviewStore store) => store.settings.backgroundTheme,
    );
    final toolbarTheme = context.select(
      (MobilePreviewStore store) => store.settings.toolbarTheme,
    );
    final background = backgroundTheme.asThemeData();
    final toolbar = toolbarTheme.asThemeData();
    return ToolPanelSection(
      title: 'Preview settings',
      children: [
        if (this.backgroundTheme)
          ListTile(
            key: const Key('background-theme'),
            title: const Text('Background color'),
            subtitle: Text(
              backgroundTheme == MobilePreviewBackgroundThemeData.dark
                  ? 'Dark'
                  : 'Light',
            ),
            trailing: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: background.scaffoldBackgroundColor,
                border: Border.all(
                  color: toolbar.colorScheme.surface,
                  width: 1,
                ),
              ),
            ),
            onTap: () {
              final state = context.read<MobilePreviewStore>();
              state.settings = state.settings.copyWith(
                backgroundTheme:
                    backgroundTheme == MobilePreviewBackgroundThemeData.dark
                        ? MobilePreviewBackgroundThemeData.light
                        : MobilePreviewBackgroundThemeData.dark,
              );
            },
          ),
        if (toolsTheme)
          ListTile(
            key: const Key('toolbar-theme'),
            title: const Text('Tools theme'),
            subtitle: Text(
              toolbarTheme == MobilePreviewToolBarThemeData.dark
                  ? 'Dark'
                  : 'Light',
            ),
            trailing: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: toolbar.scaffoldBackgroundColor,
                border: Border.all(
                  color: toolbar.colorScheme.surface,
                  width: 1,
                ),
              ),
            ),
            onTap: () {
              final state = context.read<MobilePreviewStore>();
              state.settings = state.settings.copyWith(
                toolbarTheme: toolbarTheme == MobilePreviewToolBarThemeData.dark
                    ? MobilePreviewToolBarThemeData.light
                    : MobilePreviewToolBarThemeData.dark,
              );
            },
          ),
      ],
    );
  }
}
