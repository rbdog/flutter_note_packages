# go_router_express

Flutter (Android/iOS) で使うためのパッケージ

- go_router を薄くラップした (かなり依存強め. 最新の v16系統に対応)
- node.js の express のような書き心地
- response で json ではなく widget を返せることが特徴. Scaffold で作られた widget を想定
- 内部的には get routerConfig を呼び出されたときに GoRouter のインスタンスを生成し、保持する

## インストール

```yaml
dependencies:
  go_router_express: ^1.0.0
```

## 使い心地

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

- get のみ対応. post, put, delete は未対応
- res.redirect も可能
- app.router -> MaterialApp.router() に渡す GoRouter インスタンス

## ミドルウェア

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

## 画面遷移

go_router を re-export しているため、全ての go_router の拡張機能が使えます:

```dart
// go - スタックを置き換え
context.go('/next-page');

// push - スタックに追加
context.push('/detail-page');

// pop - 戻る
context.pop();

// ボタンから遷移
ElevatedButton(
  onPressed: () => context.push('/detail'),
  child: Text('詳細へ'),
);
```

## API

**GoRouterExpress**
- `get(String path, List<WidgetMiddleware> middlewares, RouteHandler handler)` - ルート登録
- `router` - MaterialApp.router() に渡す GoRouter インスタンス

**WidgetRequest**
- `params(String name)` - パスパラメータ取得
- `query(String name)` - クエリパラメータ取得
- `pathParams` - 全パスパラメータ
- `queryParams` - 全クエリパラメータ

**WidgetResponse**
- `page(Widget widget)` - ページ Widget を返す
- `redirect(String location)` - リダイレクト

**WidgetMiddleware**
- `build(WidgetRequest req, WidgetResponse res, Widget Function() next)` - ミドルウェア処理

## Issues

バグ報告や機能リクエストは以下へお願いします:
https://github.com/rbdog/flutter_note_packages/issues

## ライセンス

MIT
