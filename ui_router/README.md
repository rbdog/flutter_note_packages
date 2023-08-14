![Header](https://github.com/rbdog/flutter_note_packages/blob/main/ui_router/static/ui-router-header.png?raw=true)

- Simple Router for Pages, Dialogs, Tabs, Loading

https://pub.dev/packages/ui_router

## Router

```
final router = UiRouter(
  pages: [
    UiPage(
      path: '/index',
      build: (state) => const MyIndexPage(),
    ),
    UiShell(
      path: '/shell',
      build: (state, child) => MyShell(child: child),
      pages: [
        UiPage(
          path: '/sub-1',
          build: (state) => const MySub1Page(),
        ),
        UiPage(
          path: '/sub-2',
          build: (state) => const MySub2Page(),
        ),
      ],
    ),
  ],
);
```

## Run App

```main.dart
void main() {
  final view = UiRouterView(router);
  final app = MaterialApp(home: view);
  runApp(app);
}
```

## Example Your Pages

```
// Index
class MyIndexPage extends StatelessWidget {
  const MyIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Index')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            router.push('/shell');
          },
          child: const Text('Push To Shell'),
        ),
      ),
    );
  }
}

// Shell
class MyShell extends StatelessWidget {
  const MyShell({
    super.key,
    required this.childPage,
  });

  final Widget childPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Shell')),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 500,
          child: childPage,
        ),
      ),
    );
  }
}

// Sub1
class MySub1Page extends StatelessWidget {
  const MySub1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sub 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            router.shell('/shell').push('/sub-2');
          },
          child: const Text('Push To Sub2'),
        ),
      ),
    );
  }
}

// Sub2
class MySub2Page extends StatelessWidget {
  const MySub2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sub 2')),
    );
  }
}
```

🎉 Contributions, Questions, Issues are welcomed!
