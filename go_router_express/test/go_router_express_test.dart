import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router_express/go_router_express.dart';

void main() {
  group('GoRouterExpress', () {
    testWidgets('should render widget from simple route', (tester) async {
      final app = GoRouterExpress((app) {
        app.get('/home', [], (req, res) {
          res.page(const Text('Home Page'));
        });
      }, initialLocation: '/home');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(find.text('Home Page'), findsOneWidget);
    });

    testWidgets('should handle path parameters', (tester) async {
      final app = GoRouterExpress((app) {
        app.get('/users/:id', [], (req, res) {
          final id = req.params('id');
          res.page(Text('User ID: $id'));
        });
      }, initialLocation: '/users/123');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(find.text('User ID: 123'), findsOneWidget);
    });

    testWidgets('should handle query parameters', (tester) async {
      final app = GoRouterExpress((app) {
        app.get('/search', [], (req, res) {
          final query = req.query('q');
          res.page(Text('Search: $query'));
        });
      }, initialLocation: '/search?q=flutter');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(find.text('Search: flutter'), findsOneWidget);
    });

    testWidgets('should handle multiple path parameters', (tester) async {
      final app = GoRouterExpress((app) {
        app.get('/users/:userId/posts/:postId', [], (req, res) {
          final userId = req.params('userId');
          final postId = req.params('postId');
          res.page(Text('User: $userId, Post: $postId'));
        });
      }, initialLocation: '/users/123/posts/456');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(find.text('User: 123, Post: 456'), findsOneWidget);
    });

    testWidgets('should show error page for non-existent route', (
      tester,
    ) async {
      final app = GoRouterExpress((app) {
        app.get('/home', [], (req, res) {
          res.page(const Text('Home Page'));
        });
      }, initialLocation: '/not-found');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(find.textContaining('Page not found'), findsOneWidget);
    });

    testWidgets('should use custom error builder', (tester) async {
      final app = GoRouterExpress(
        (app) {
          app.get('/home', [], (req, res) {
            res.page(const Text('Home Page'));
          });
        },
        initialLocation: '/not-found',
        errorBuilder: (context, state) => const Text('Custom 404'),
      );

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(find.text('Custom 404'), findsOneWidget);
    });
  });

  group('WidgetRequest', () {
    testWidgets('should access all path parameters', (tester) async {
      final app = GoRouterExpress((app) {
        app.get('/users/:userId/posts/:postId', [], (req, res) {
          final params = req.pathParams;
          expect(params['userId'], '123');
          expect(params['postId'], '456');
          res.page(const Text('OK'));
        });
      }, initialLocation: '/users/123/posts/456');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();
    });

    testWidgets('should access all query parameters', (tester) async {
      final app = GoRouterExpress((app) {
        app.get('/search', [], (req, res) {
          final params = req.queryParams;
          expect(params['q'], 'flutter');
          expect(params['sort'], 'date');
          res.page(const Text('OK'));
        });
      }, initialLocation: '/search?q=flutter&sort=date');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();
    });

    testWidgets('should return null for non-existent parameter', (
      tester,
    ) async {
      final app = GoRouterExpress((app) {
        app.get('/users/:id', [], (req, res) {
          expect(req.params('nonexistent'), isNull);
          expect(req.query('nonexistent'), isNull);
          res.page(const Text('OK'));
        });
      }, initialLocation: '/users/123');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();
    });
  });

  group('WidgetResponse', () {
    test('should throw when setting response twice', () {
      final res = WidgetResponse(context: _FakeContext());

      res.page(const Text('First'));

      expect(() => res.page(const Text('Second')), throwsA(isA<StateError>()));
    });

    test('should throw when setting redirect after widget', () {
      final res = WidgetResponse(context: _FakeContext());

      res.page(const Text('Widget'));

      expect(() => res.redirect('/home'), throwsA(isA<StateError>()));
    });

    test('should throw when setting widget after redirect', () {
      final res = WidgetResponse(context: _FakeContext());

      res.redirect('/home');

      expect(() => res.page(const Text('Widget')), throwsA(isA<StateError>()));
    });

    test('should track response state correctly', () {
      final res = WidgetResponse(context: _FakeContext());

      expect(res.hasResponse, false);
      expect(res.responseWidget, isNull);
      expect(res.redirectLocation, isNull);

      res.page(const Text('Test'));

      expect(res.hasResponse, true);
      expect(res.responseWidget, isA<Text>());
      expect(res.redirectLocation, isNull);
    });

    test('should track redirect state correctly', () {
      final res = WidgetResponse(context: _FakeContext());

      expect(res.hasResponse, false);

      res.redirect('/home');

      expect(res.hasResponse, true);
      expect(res.responseWidget, isNull);
      expect(res.redirectLocation, '/home');
    });
  });

  group('WidgetMiddleware', () {
    testWidgets('should execute middleware before handler', (tester) async {
      final executionOrder = <String>[];

      final middleware = _TestMiddleware((req, res, next) {
        executionOrder.add('middleware');
        return next();
      });

      final app = GoRouterExpress((app) {
        app.get('/protected', [middleware], (req, res) {
          executionOrder.add('handler');
          res.page(const Text('Protected Page'));
        });
      }, initialLocation: '/protected');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(executionOrder, ['middleware', 'handler']);
    });

    testWidgets('should allow middleware to return widget directly', (
      tester,
    ) async {
      final authMiddleware = _TestMiddleware((req, res, next) {
        final token = req.query('token');
        if (token != 'valid') {
          return const Text('Unauthorized');
        }
        return next();
      });

      final app = GoRouterExpress((app) {
        app.get('/protected', [authMiddleware], (req, res) {
          res.page(const Text('Protected Page'));
        });
      }, initialLocation: '/protected');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(find.text('Unauthorized'), findsOneWidget);
      expect(find.text('Protected Page'), findsNothing);
    });

    testWidgets('should allow middleware to pass through to handler', (
      tester,
    ) async {
      final authMiddleware = _TestMiddleware((req, res, next) {
        final token = req.query('token');
        if (token != 'valid') {
          return const Text('Unauthorized');
        }
        return next();
      });

      final app = GoRouterExpress((app) {
        app.get('/protected', [authMiddleware], (req, res) {
          res.page(const Text('Protected Page'));
        });
      }, initialLocation: '/protected?token=valid');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(find.text('Protected Page'), findsOneWidget);
      expect(find.text('Unauthorized'), findsNothing);
    });

    testWidgets('should execute multiple middleware in order', (tester) async {
      final executionOrder = <String>[];

      final middleware1 = _TestMiddleware((req, res, next) {
        executionOrder.add('middleware1');
        return next();
      });

      final middleware2 = _TestMiddleware((req, res, next) {
        executionOrder.add('middleware2');
        return next();
      });

      final middleware3 = _TestMiddleware((req, res, next) {
        executionOrder.add('middleware3');
        return next();
      });

      final app = GoRouterExpress((app) {
        app.get('/api', [middleware1, middleware2, middleware3], (req, res) {
          executionOrder.add('handler');
          res.page(const Text('API Response'));
        });
      }, initialLocation: '/api');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(executionOrder, [
        'middleware1',
        'middleware2',
        'middleware3',
        'handler',
      ]);
    });

    testWidgets('should stop execution if middleware does not call next', (
      tester,
    ) async {
      final executionOrder = <String>[];

      final middleware1 = _TestMiddleware((req, res, next) {
        executionOrder.add('middleware1');
        return next();
      });

      final blockingMiddleware = _TestMiddleware((req, res, next) {
        executionOrder.add('blocking');
        return const Text('Blocked');
      });

      final middleware3 = _TestMiddleware((req, res, next) {
        executionOrder.add('middleware3');
        return next();
      });

      final app = GoRouterExpress((app) {
        app.get('/api', [middleware1, blockingMiddleware, middleware3], (
          req,
          res,
        ) {
          executionOrder.add('handler');
          res.page(const Text('API Response'));
        });
      }, initialLocation: '/api');

      await tester.pumpWidget(MaterialApp.router(routerConfig: app.router));

      await tester.pumpAndSettle();

      expect(executionOrder, ['middleware1', 'blocking']);
      expect(find.text('Blocked'), findsOneWidget);
    });
  });
}

// Helper class for testing middleware
class _TestMiddleware extends WidgetMiddleware {
  _TestMiddleware(this.builder);

  final Widget Function(
    WidgetRequest req,
    WidgetResponse res,
    Widget Function() next,
  )
  builder;

  @override
  Widget build(WidgetRequest req, WidgetResponse res, Widget Function() next) {
    return builder(req, res, next);
  }
}

// Minimal BuildContext implementation for testing
class _FakeContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
