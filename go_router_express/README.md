# go_router_express

An Express.js-like wrapper for [go_router](https://pub.dev/packages/go_router) .

## Usage

```dart
final app = GoRouterExpress((app) {
  app.get('/todos/:id', [], (req, res) {
    final id = req.params('id');
    res.page(TodoPage(id: id));
  });
});

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: app.router,
    );
  }
}
```

## Middleware

```dart
class AuthMiddleware extends WidgetMiddleware {
  @override
  Widget build(WidgetRequest req, WidgetResponse res, Widget Function() next) {
    if (req.query('token') == null) {
      return UnauthorizedPage();
    }
    return next();
  }
}

app.get('/admin', [AuthMiddleware()], (req, res) {
  res.page(AdminPage());
});
```

## Navigation

go_router is re-exported, so you can use all go_router extensions:

```dart
// go - replace navigation stack
context.go('/next-page');

// push - add to navigation stack
context.push('/detail-page');

// pop - go back
context.pop();

// From button
ElevatedButton(
  onPressed: () => context.push('/detail'),
  child: Text('Go to Detail'),
);
```

## Issues

For bug reports and feature requests, please visit:
[GitHub issues](https://github.com/rbdog/flutter_note_packages/issues)


## License

MIT

[📖 Japanese Documentation](https://github.com/rbdog/flutter_note_packages/blob/main/go_router_express/doc/ja/README.md)
