///
/// /a/:x/b/:y => [x, y]
///
Set<String> paramKeysFromPattern(String pattern) {
  final afterColons = pattern.split(':');
  final keys = afterColons.map(
    (afterColon) {
      final beforeSlash = afterColon.split('/').first;
      return beforeSlash;
    },
  );
  final keySet = keys.toSet();
  keySet.remove('');
  return keySet;
}
