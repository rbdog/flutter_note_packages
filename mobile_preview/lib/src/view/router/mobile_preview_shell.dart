import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_preview/src/state/device/provider.dart';
import 'package:mobile_preview/src/state/device_settings/provider.dart';
import 'package:mobile_preview/src/state/panel/provider.dart';
import 'package:mobile_preview/src/view/router/media_query_observer.dart';
import 'package:mobile_preview/src/view/router/device_simulater_page.dart';
import 'package:mobile_preview/src/view/widgets/panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui' as ui;

import '../../dart_assets/devices/index.dart';
import '../../logic/device/types/device.dart';
import '../../logic/device/types/id.dart';
import '../../logic/screenshot.dart';
import '../../state/data.dart';
import '../widgets/accessibility.dart';
import '../widgets/device_section.dart';
import '../widgets/large_layout.dart';
import '../widgets/small_layout.dart';
import '../widgets/system_section.dart';

/// MobilePreview
class MobilePreviewShell extends ConsumerWidget {
  const MobilePreviewShell({
    super.key,
    this.initialDevice,
    required this.child,
  });

  /// The previewed widget.
  final Widget child;

  /// The default selected device for the first time.
  final Device? initialDevice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSettings = ref.watch(deviceSettingsProvider);
    final asyncDevice = ref.watch(deviceProvider);
    final panelIsOpen = ref.watch(panelIsOpenProvider);

    if (asyncSettings.isLoading || asyncDevice.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (asyncSettings.hasError) {
      print('settings エラーが発生したのでプレビューを無効にします');
      return child;
    }

    if (asyncDevice.hasError) {
      print('device エラーが発生したのでプレビューを無効にします');
      return child;
    }

    if (!asyncSettings.hasValue || !asyncDevice.hasValue) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final device = asyncDevice.value!;
    final settings = asyncSettings.value!;

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

                final double rightPanelOffset =
                    !isSmall ? Panel.panelWidth - 10 : 0;
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
                          slivers: [
                            DeviceSection(
                              device: device,
                              settings: settings,
                            ),
                            SystemSection(
                              settings: settings,
                            ),
                            AccessibilitySection(
                              settings: settings,
                            ),
                          ],
                          maxMenuHeight: constraints.maxHeight * 0.5,
                          scaffoldKey: scaffoldKey,
                          onMenuVisibleChanged: (isVisible) {
                            ref.read(panelIsOpenProvider.notifier).state =
                                isVisible;
                          },
                        ),
                      ),
                    if (!isSmall)
                      Positioned.fill(
                        key: const Key('Large'),
                        child: LargeLayout(
                          slivers: [
                            DeviceSection(
                              device: device,
                              settings: settings,
                            ),
                            SystemSection(
                              settings: settings,
                            ),
                            AccessibilitySection(
                              settings: settings,
                            ),
                          ],
                        ),
                      ),
                    AnimatedPositioned(
                      key: const Key('preview'),
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
                          builder: (context) => DeviceSimulaterPage(
                            screenshotKey: _screenshotKey,
                            device: device,
                            settings: settings,
                            child: child,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: IgnorePointer(
                        ignoring: !panelIsOpen,
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
final _screenshotKey = GlobalKey();

Future<DeviceScreenshot> screenshot(
  Device device,
  MobilePreviewData settings,
) async {
  final boundary = _screenshotKey.currentContext!.findRenderObject()
      as RenderRepaintBoundary;
  const format = ui.ImageByteFormat.png;

  final image = await boundary.toImage(
    pixelRatio: device.pixelRatio,
  );
  final byteData = await image.toByteData(
    format: format,
  );
  final bytes = byteData!.buffer.asUint8List();
  final screenshot = DeviceScreenshot(
    device: device,
    bytes: bytes,
    format: format,
  );
  return screenshot;
}

/// The list of all available device identifiers.
List<DeviceId> availableDeviceIds() {
  return Devices.all.map((it) => it.id).toList();
}
