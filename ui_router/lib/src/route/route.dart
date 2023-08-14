enum UiRouteType {
  /// Page
  page,

  /// Nav Shell
  navShell,

  /// Tab Shell
  tabShell,
}

abstract class UiRoute {
  UiRouteType get type;
  String get path;
}
