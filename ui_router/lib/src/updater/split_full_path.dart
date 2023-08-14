List<String> splitFullPath(String fullPath) {
  final paths = fullPath.split('/');
  paths.remove('');
  return paths.map((e) => '/$e').toList();
}
