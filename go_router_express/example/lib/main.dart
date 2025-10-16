import 'package:flutter/material.dart';
import 'package:go_router_express/go_router_express.dart';

final express = GoRouterExpress((app) {
  app.get('/', [], (req, res) {
    res.page(const HomeScreen());
  });

  app.get('/details', [LoggingMiddleware()], (req, res) {
    res.page(const DetailsScreen());
  });
});

class LoggingMiddleware extends WidgetMiddleware {
  @override
  Widget build(WidgetRequest req, WidgetResponse res, Widget Function() next) {
    debugPrint('Route: ${req.path}');
    return next();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: express.router);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/details'),
          child: const Text('Go to the Details screen'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}
