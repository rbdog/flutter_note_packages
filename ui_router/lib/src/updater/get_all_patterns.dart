import 'package:ui_router/src/config/config.dart';
import 'package:ui_router/src/config/nav_shell_config.dart';
import 'package:ui_router/src/config/page_config.dart';
import 'package:ui_router/src/config/tab_shell_config.dart';
import 'package:ui_router/src/route/route.dart';

Set<String> getAllPatterns({required UiNavShellConfig shellConfig}) {
  final list = shellConfig.pages;
  return getAllPatternsFromList(configs: list);
}

Set<String> getAllPatternsFromList({required List<UiConfig> configs}) {
  final nodes = configs.map(
    (config) => _nodeFromConfig(config: config, parentPath: ''),
  );
  Set<String> allPaths = {};
  for (var node in nodes) {
    final paths = _getSelfAndChildrenPaths(node);
    allPaths.addAll(paths);
  }
  allPaths.remove('');
  return allPaths;
}

Set<String> _getSelfAndChildrenPaths(_Node node) {
  Set<String> paths = {};
  if (node is _Leaf) {
    paths.add(node.fullPath);
  }
  if (node is _Internal) {
    for (var child in node.children) {
      final childrenPaths = _getSelfAndChildrenPaths(child);
      paths.addAll(childrenPaths);
    }
  }
  return paths;
}

_Node _nodeFromConfig({
  required UiConfig config,
  required String parentPath,
}) {
  switch (config.routeType) {
    case UiRouteType.page:
      final page = config as UiPageConfig;
      return _Leaf(fullPath: parentPath + page.path);
    case UiRouteType.navShell:
      final navShell = config as UiNavShellConfig;
      final children = navShell.pages.map(
        (subRoute) => _nodeFromConfig(
          config: subRoute,
          parentPath: parentPath + navShell.path,
        ),
      );
      return _Internal(
        fullPath: parentPath + navShell.path,
        children: children.toList(),
      );
    case UiRouteType.tabShell:
      final tabShell = config as UiTabShellConfig;
      final children = tabShell.tabs.map(
        (subRoute) => _nodeFromConfig(
          config: subRoute,
          parentPath: parentPath + subRoute.path,
        ),
      );
      return _Internal(
        fullPath: parentPath + tabShell.path,
        children: children.toList(),
      );
  }
}

abstract class _Node {
  String get fullPath;
}

class _Internal implements _Node {
  const _Internal({
    required this.fullPath,
    required this.children,
  });
  @override
  final String fullPath;
  final List<_Node> children;
}

class _Leaf implements _Node {
  const _Leaf({
    required this.fullPath,
  });
  @override
  final String fullPath;
}
