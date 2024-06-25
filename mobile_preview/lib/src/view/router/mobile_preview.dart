import 'dart:async';

import 'package:mobile_preview/src/state/store.dart';
import 'package:mobile_preview/src/logic/media_query_observer.dart';
import 'package:mobile_preview/src/view/router/device_simulater_page.dart';
import 'package:mobile_preview/src/view/widgets/accessibility.dart';
import 'package:mobile_preview/src/view/widgets/device_section.dart';
import 'package:mobile_preview/src/view/widgets/system_section.dart';
import 'package:mobile_preview/src/view/widgets/panel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../../dart_assets/devices/index.dart';
import '../../external/locales/default_locales.dart';
import '../../logic/device/types/device.dart';
import '../../logic/device/types/id.dart';
import '../../logic/screenshot.dart';
import '../widgets/large_layout.dart';
import '../widgets/small_layout.dart';

/// MobilePreview
class MobilePreview extends StatefulWidget {
  const MobilePreview({
    super.key,
    required this.builder,
    this.initialDevice,
  });

  /// The previewed widget.
  final WidgetBuilder builder;

  /// The default selected device for the first time.
  final Device? initialDevice;

  /// All the default tools included in the menu
  static const List<Widget> sections = [
    DeviceSection(),
    SystemSection(),
    AccessibilitySection(),
  ];

  @override
  MobilePreviewState createState() => MobilePreviewState();

  /// The currently selected device.
  static Device selectedDevice(BuildContext context) {
    return context.select(
      (MobilePreviewStore store) => store.device,
    );
  }

  /// The simulated target platform for the currently selected device.
  static TargetPlatform platform(BuildContext context) {
    final platform = context.select(
      (MobilePreviewStore store) => store.device.id.platform,
    );
    return platform;
  }

  /// The simulated visual density for the currently selected device.
  static VisualDensity visualDensity(BuildContext context) {
    return VisualDensity.standard;
  }

  /// Create a new [ThemeData] from the given [data], but with updated properties from
  /// the currently simulated device.
  static Widget appBuilder(BuildContext context, Widget? child) {
    if (!_isEnabled(context)) {
      return child!;
    }

    final theme = Theme.of(context);
    final isInitializedAndEnabled = context.select(
      (MobilePreviewStore store) => store.state.maybeMap(
        initialized: (initialized) => true,
        orElse: () => false,
      ),
    );

    if (!isInitializedAndEnabled) {
      return child!;
    }

    return Theme(
      data: theme.copyWith(
        platform: platform(context),
        visualDensity: visualDensity(context),
      ),
      child: child!,
    );
  }

  static bool isEnabled(BuildContext context) {
    if (_isEnabled(context)) {
      return context.select(
        (MobilePreviewStore store) => store.state.maybeMap(
          initialized: (initialized) => true,
          orElse: () => false,
        ),
      );
    }
    return false;
  }

  static bool _isEnabled(BuildContext context) {
    final state = context.findAncestorStateOfType<MobilePreviewState>();
    return state != null;
  }

  /// Currently defined locale.
  static Locale? locale(BuildContext context) {
    if (!_isEnabled(context)) {
      return null;
    }

    final store = Provider.of<MobilePreviewStore>(context);
    return store.state.maybeMap(
      initialized: (state) {
        final splits = state.data.locale.split('_');
        final languageCode = splits[0];
        String? scriptCode, countryCode;
        if (splits.length > 2) {
          scriptCode = splits[1];
          countryCode = splits[2];
        } else if (splits.length > 1) {
          countryCode = splits[1];
        }
        return Locale.fromSubtags(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode,
        );
      },
      orElse: () => PlatformDispatcher
          .instance.views.first.platformDispatcher.locales.first,
    );
  }

  /// Make the toolbar visible to the user.
  static void showToolbar(BuildContext context) {
    final store = Provider.of<MobilePreviewStore>(context);
    store.data = store.data.copyWith(
      isToolbarVisible: true,
    );
  }

  /// Hide the toolbar.
  static void hideToolbar(BuildContext context) {
    final store = Provider.of<MobilePreviewStore>(context);
    store.data = store.data.copyWith(
      isToolbarVisible: false,
    );
  }

  /// Select a device from its unique [deviceIdentifier].
  static void selectDevice(
    BuildContext context,
    DeviceId deviceIdentifier,
  ) {
    final store = Provider.of<MobilePreviewStore>(context, listen: false);
    store.selectDevice(deviceIdentifier);
  }

  /// The list of all available device identifiers.
  static List<DeviceId> availableDeviceIds(
    BuildContext context,
  ) {
    final store = Provider.of<MobilePreviewStore>(context, listen: false);
    return store.devices.map((it) => it.id).toList();
  }

  /// All available locales in the tool.
  static List<Locale> allLocales(BuildContext context) {
    if (!_isEnabled(context)) {
      return defaultAvailableLocales.map((it) => Locale(it.code)).toList();
    }
    final store = Provider.of<MobilePreviewStore>(context);
    return store.state
        .maybeMap(
          initialized: (it) => it.locales,
          orElse: () => defaultAvailableLocales,
        )
        .map((it) => Locale(it.code))
        .toList();
  }

  /// Take a screenshot.
  static Future<DeviceScreenshot> screenshot(BuildContext context) {
    final state = context.findAncestorStateOfType<MobilePreviewState>();
    final store = context.read<MobilePreviewStore>();
    return state!.screenshot(store);
  }
}

class MobilePreviewState extends State<MobilePreview> {
  bool _isToolPanelPopOverOpen = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// Whenever the [screenshot] is called, a new value is pushed to
  /// this stream.
  Stream<DeviceScreenshot> get onScreenshot => _onScreenshot!.stream;

  /// Takes a screenshot with the current configuration.
  Future<DeviceScreenshot> screenshot(MobilePreviewStore store) async {
    final boundary = _screenshotKey.currentContext!.findRenderObject()
        as RenderRepaintBoundary;
    const format = ui.ImageByteFormat.png;

    final image = await boundary.toImage(
      pixelRatio: store.device.pixelRatio,
    );
    final byteData = await image.toByteData(
      format: format,
    );
    final bytes = byteData!.buffer.asUint8List();
    final screenshot = DeviceScreenshot(
      device: store.device,
      bytes: bytes,
      format: format,
    );
    _onScreenshot?.add(screenshot);
    return screenshot;
  }

  /// The repaint key used for rendering screenshots.
  final _screenshotKey = GlobalKey();

  /// A stream that sends a new value each time the user takes
  /// a new screenshot.
  StreamController<DeviceScreenshot>? _onScreenshot;

  @override
  void initState() {
    _onScreenshot = StreamController<DeviceScreenshot>.broadcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MobilePreviewStore(
        defaultDevice: widget.initialDevice ?? Devices.all.first,
        devices: Devices.all,
      ),
      builder: (context, child) {
        final isInitialized = context.select(
          (MobilePreviewStore store) => store.state.maybeMap(
            initialized: (_) => true,
            orElse: () => false,
          ),
        );

        if (!isInitialized) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

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
                              slivers: MobilePreview.sections,
                              maxMenuHeight: constraints.maxHeight * 0.5,
                              scaffoldKey: scaffoldKey,
                              onMenuVisibleChanged: (isVisible) => setState(() {
                                _isToolPanelPopOverOpen = isVisible;
                              }),
                            ),
                          ),
                        if (!isSmall)
                          const Positioned.fill(
                            key: Key('Large'),
                            child: LargeLayout(
                              slivers: MobilePreview.sections,
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
                                appBuilder: widget.builder,
                                screenshotKey: _screenshotKey,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: IgnorePointer(
                            ignoring: !_isToolPanelPopOverOpen,
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
      },
    );
  }
}
