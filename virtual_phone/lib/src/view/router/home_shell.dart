import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:virtual_phone/src/view/widgets/model_section.dart';

import '../../dart_assets/devices/index.dart';
import '../../logic/device_model/types/id.dart';
import '../../logic/config/types/config.dart';
import '../../state/menu/provider.dart';
import '../widgets/state_section.dart';
import '../widgets/large_layout.dart';
import '../widgets/small_layout.dart';
import '../widgets/settings_section.dart';
import 'device_container_page.dart';
import 'media_query_observer.dart';

/// HomeShell
class HomeShell extends ConsumerWidget {
  const HomeShell({
    super.key,
    this.config,
    required this.child,
  });

  /// The previewed widget.
  final Widget child;

  /// The default selected device for the first time.
  final Config? config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuIsOpen = ref.watch(menuIsOpenProvider);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: MediaQueryObserver(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final mediaQuery = MediaQuery.of(context);
                final isSmall = constraints.maxWidth < 700;

                final double rightPanelOffset = !isSmall ? 310 - 10 : 0;
                final double bottomPanelOffset =
                    isSmall ? mediaQuery.padding.bottom + 52 : 0;
                return Stack(
                  children: [
                    if (isSmall)
                      Positioned(
                        key: const Key('Small'),
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: SmallLayout(
                          slivers: const [
                            ModelSection(),
                            StateSection(),
                            SettingsSection(),
                          ],
                          maxMenuHeight: constraints.maxHeight * 0.5,
                          scaffoldKey: scaffoldKey,
                          onMenuVisibleChanged: (isVisible) {
                            ref.read(menuIsOpenProvider.notifier).state =
                                isVisible;
                          },
                        ),
                      ),
                    if (!isSmall)
                      const Positioned.fill(
                        key: Key('Large'),
                        child: LargeLayout(
                          menuSections: [
                            ModelSection(),
                            StateSection(),
                            SettingsSection(),
                          ],
                        ),
                      ),
                    AnimatedPositioned(
                      key: const Key('Container'),
                      duration: const Duration(milliseconds: 200),
                      left: 0,
                      right: rightPanelOffset,
                      top: 0,
                      bottom: bottomPanelOffset,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.zero,
                          color: Colors.black,
                        ),
                        child: Builder(
                          builder: (context) => DeviceContainerPage(
                            screenshotKey: screenshotKey,
                            child: child,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      key: const Key('ModalBackground'),
                      child: IgnorePointer(
                        ignoring: !menuIsOpen,
                        child: Localizations(
                          locale: const Locale('en', 'US'),
                          delegates: const [
                            GlobalMaterialLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                          ],
                          child: Navigator(
                            onGenerateInitialRoutes: (navigator, name) {
                              return [
                                MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    key: scaffoldKey,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ];
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

/// The repaint key used for rendering screenshots.
final screenshotKey = GlobalKey();

/// The list of all available device identifiers.
List<DeviceModelId> availableDeviceIds() {
  return Devices.all.map((it) => it.id).toList();
}
