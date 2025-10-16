/// An Express.js-like wrapper for go_router that provides a familiar routing API
/// for Flutter applications.
///
/// This library provides:
/// - Express.js-style route registration with `app.get()`
/// - Request/response objects for handling routes
/// - Middleware support for cross-cutting concerns like authentication
/// - Path parameters and query parameters support
///
/// Example:
/// ```dart
/// import 'package:flutter/material.dart';
/// import 'package:go_router_express/go_router_express.dart';
///
/// void main() {
///   final app = GoRouterExpress();
///
///   app.get('/todos/:id', [], (req, res) {
///     final id = req.params('id');
///     res.widget(TodoPage(id: id));
///   });
///
///   runApp(MyApp(app: app));
/// }
///
/// class MyApp extends StatelessWidget {
///   const MyApp({super.key, required this.app});
///
///   final GoRouterExpress app;
///
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp.router(
///       routerConfig: app.routerConfig,
///     );
///   }
/// }
/// ```
library;

export 'src/go_router_express.dart';
export 'src/widget_request.dart';
export 'src/widget_response.dart';
export 'src/widget_middleware.dart';

// Re-export go_router for convenient access to context.go(), context.push(), context.pop(), etc.
export 'package:go_router/go_router.dart';
