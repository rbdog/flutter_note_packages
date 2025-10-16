import 'package:flutter/widgets.dart';
import 'package:go_router_express/src/widget_request.dart';
import 'package:go_router_express/src/widget_response.dart';

/// Abstract base class for creating middleware in the go_router_express framework.
///
/// Middleware can intercept requests and either return a widget directly
/// (e.g., for authentication errors) or call [next] to continue to the
/// next middleware or route handler.
///
/// Example:
/// ```dart
/// class AuthMiddleware extends WidgetMiddleware {
///   @override
///   Widget build(WidgetRequest req, WidgetResponse res, Widget Function() next) {
///     if (req.query('token') == null) {
///       return UnauthorizedPage();
///     }
///     return next();
///   }
/// }
/// ```
abstract class WidgetMiddleware {
  /// Builds the widget for this middleware.
  ///
  /// The middleware can either:
  /// - Return a widget directly (e.g., error page, redirect)
  /// - Call [next()] to continue to the next middleware or route handler
  ///
  /// The [req] parameter contains request information.
  /// The [res] parameter allows setting responses.
  /// The [next] parameter is a function that returns the next widget in the chain.
  Widget build(WidgetRequest req, WidgetResponse res, Widget Function() next);
}

/// Internal class to execute a chain of middleware.
class MiddlewareChain {
  /// Creates a new [MiddlewareChain].
  MiddlewareChain({required this.middlewares, required this.finalHandler});

  /// The list of middleware to execute.
  final List<WidgetMiddleware> middlewares;

  /// The final handler to execute after all middleware.
  final Widget Function(WidgetRequest req, WidgetResponse res) finalHandler;

  /// Executes the middleware chain.
  Widget execute(WidgetRequest req, WidgetResponse res) {
    return _executeMiddleware(req, res, 0);
  }

  Widget _executeMiddleware(WidgetRequest req, WidgetResponse res, int index) {
    if (index >= middlewares.length) {
      return finalHandler(req, res);
    }

    final middleware = middlewares[index];
    return middleware.build(
      req,
      res,
      () => _executeMiddleware(req, res, index + 1),
    );
  }
}
