import 'package:flutter/widgets.dart';

/// Represents a response in the go_router_express framework.
///
/// This class provides methods to return widgets or perform redirects,
/// similar to Express.js response object.
class WidgetResponse {
  /// Creates a new [WidgetResponse] instance.
  WidgetResponse({required this.context});

  /// The [BuildContext] associated with this response.
  final BuildContext context;

  /// The widget to be rendered. This is set by calling [page].
  Widget? _widget;

  /// The redirect location. This is set by calling [redirect].
  String? _redirectLocation;

  /// Returns true if a response has been set (either widget or redirect).
  bool get hasResponse => _widget != null || _redirectLocation != null;

  /// Returns the widget if one was set.
  Widget? get responseWidget => _widget;

  /// Returns the redirect location if one was set.
  String? get redirectLocation => _redirectLocation;

  /// Sets the page (widget) to be rendered for this route.
  ///
  /// Example:
  /// ```dart
  /// res.page(TodoPage(id: '123'));
  /// ```
  void page(Widget widget) {
    if (hasResponse) {
      throw StateError('Response has already been set');
    }
    _widget = widget;
  }

  /// Redirects to the specified [location].
  ///
  /// Example:
  /// ```dart
  /// res.redirect('/login');
  /// ```
  void redirect(String location) {
    if (hasResponse) {
      throw StateError('Response has already been set');
    }
    _redirectLocation = location;
  }
}
