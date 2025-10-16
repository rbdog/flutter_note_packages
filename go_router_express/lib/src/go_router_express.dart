import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_express/src/widget_request.dart';
import 'package:go_router_express/src/widget_response.dart';
import 'package:go_router_express/src/widget_middleware.dart';

/// Type definition for a route handler function.
typedef RouteHandler = void Function(WidgetRequest req, WidgetResponse res);

/// Type definition for route setup callback.
typedef RouteSetup = void Function(GoRouterExpress app);

/// Configuration class for a single route.
class _RouteConfig {
  _RouteConfig({
    required this.path,
    required this.handler,
    this.middlewares = const [],
  });

  final String path;
  final RouteHandler handler;
  final List<WidgetMiddleware> middlewares;
}

/// An Express.js-like wrapper for go_router.
///
/// This class provides a familiar Express.js-style API for defining routes
/// in Flutter applications using go_router.
///
/// Example:
/// ```dart
/// final express = GoRouterExpress((app) {
///   app.get('/todos/:id', [], (req, res) {
///     final id = req.params('id');
///     res.page(TodoPage(id: id));
///   });
/// });
///
/// // Use in MaterialApp
/// MaterialApp.router(
///   routerConfig: express.router,
/// );
/// ```
class GoRouterExpress {
  GoRouterExpress(
    RouteSetup setup, {
    String initialLocation = '/',
    bool debugLogDiagnostics = false,
    Widget Function(BuildContext, GoRouterState)? errorBuilder,
  }) {
    // Call setup to collect route definitions
    setup(this);

    // Build GoRoute list
    final routes = _routes.map((routeConfig) {
      return GoRoute(
        path: routeConfig.path,
        builder: (context, state) {
          final req = WidgetRequest(context: context, state: state);
          final res = WidgetResponse(context: context);

          if (routeConfig.middlewares.isEmpty) {
            routeConfig.handler(req, res);
          } else {
            final chain = MiddlewareChain(
              middlewares: routeConfig.middlewares,
              finalHandler: (req, res) {
                routeConfig.handler(req, res);
                return res.responseWidget ?? const SizedBox.shrink();
              },
            );
            return chain.execute(req, res);
          }

          if (res.redirectLocation != null) {
            // Perform redirect by using GoRouter's redirect
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go(res.redirectLocation!);
            });
            return const SizedBox.shrink();
          }

          return res.responseWidget ?? const SizedBox.shrink();
        },
      );
    }).toList();

    _router = GoRouter(
      routes: routes,
      initialLocation: initialLocation,
      debugLogDiagnostics: debugLogDiagnostics,
      errorBuilder: errorBuilder ??
          (context, state) => Center(
                child: Text('Page not found: ${state.uri.path}'),
              ),
    );
  }

  final List<_RouteConfig> _routes = [];
  late final GoRouter _router;

  /// The underlying GoRouter instance.
  ///
  /// Pass this to MaterialApp.router():
  /// ```dart
  /// MaterialApp.router(
  ///   routerConfig: express.router,
  /// )
  /// ```
  GoRouter get router => _router;

  /// Registers a GET route.
  ///
  /// The [path] can include path parameters using colon notation (e.g., `/users/:id`).
  /// The [middlewares] are executed in order before the [handler].
  /// The [handler] receives a [WidgetRequest] and [WidgetResponse] object.
  ///
  /// Example:
  /// ```dart
  /// app.get('/todos/:id', [AuthMiddleware()], (req, res) {
  ///   final id = req.params('id');
  ///   res.page(TodoPage(id: id));
  /// });
  /// ```
  void get(
    String path,
    List<WidgetMiddleware> middlewares,
    RouteHandler handler,
  ) {
    _routes.add(_RouteConfig(
      path: path,
      handler: handler,
      middlewares: middlewares,
    ));
  }
}
