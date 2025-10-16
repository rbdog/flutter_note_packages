# go_router_express

An Express.js-like wrapper for [go_router](https://pub.dev/packages/go_router).

## Usage

```dart
final express = GoRouterExpress((app) {
  app.get('/', [], (req, res) {
    res.page(const HomePage());
  });

  app.get('/details', [], (req, res) {
    res.page(const DetailsPage());
  });
});

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
```

## Middleware

```dart
class LoggingMiddleware extends WidgetMiddleware {
  @override
  Widget build(WidgetRequest req, WidgetResponse res, Widget Function() next) {
    debugPrint('Route: ${req.path}');
    return next();
  }
}

// Use middleware in routes
final express = GoRouterExpress((app) {
  app.get('/details', [LoggingMiddleware()], (req, res) {
    res.page(const DetailsPage());
  });
});
```

## Navigation

go_router is re-exported, so you can use all go_router extensions:

```dart
// go - replace navigation stack
context.go('/details');

// push - add to navigation stack
context.push('/details');

// pop - go back
context.pop();

// From button
ElevatedButton(
  onPressed: () => context.go('/details'),
  child: const Text('Go to Details'),
);
```

## Issues

For bug reports and feature requests, please visit:
[GitHub issues](https://github.com/rbdog/flutter_note_packages/issues)


## License

MIT

[📖 Japanese Documentation](https://github.com/rbdog/flutter_note_packages/blob/main/go_router_express/doc/ja/README.md)
