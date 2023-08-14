import 'package:flutter/material.dart';
import 'package:ui_router/src/updater/decode_query.dart';
import 'package:ui_router/src/updater/encode_query.dart';
import 'package:ui_router/src/updater/path_utils.dart';
import 'package:ui_router/src/updater/param_keys_from_pattern.dart';

class UiUri {
  UiUri({
    required this.pattern,
    required this.pathParams,
    required this.queryParams,
  });
  String pattern;
  Map<String, String> pathParams;
  Map<String, String> queryParams;
}

///
/// args
///   - uri: /a/999
///   - patterns: [ /a/:x, /c/:y, /d/:z]
///
UiUri? decodeUri(
  String uri,
  Set<String> patterns,
) {
  debugPrint('searching uri=$uri from patterns=$patterns ...');
  final realPath = uri.split('?').first;
  for (final pattern in patterns) {
    // filter by slash count
    final slashsInPattern = '/'.allMatches(pattern).length;
    final slashsInLri = '/'.allMatches(realPath).length;
    if (slashsInPattern != slashsInLri) {
      continue;
    }
    // get [x]
    final pathParamKeys = paramKeysFromPattern(pattern).toList();
    // /a/:x AND [x]
    final regExp = patternToRegExp(pattern, pathParamKeys);
    final hasMatch = regExp.hasMatch(realPath);
    if (!hasMatch) continue;
    // {x: 999}
    var match = regExp.firstMatch(realPath)!;
    final pathParams = extractPathParameters(pathParamKeys, match);
    Map<String, String> queryParams = {};
    if (uri.contains('&')) {
      queryParams = decodeQuery(uri);
    }
    return UiUri(
      pattern: pattern,
      pathParams: pathParams,
      queryParams: queryParams,
    );
  }
  return null;
}

String encodeUri(
  String pattern,
  Map<String, String> pathParams,
  Map<String, String> queryParams,
) {
  var uri = pattern;
  for (final pathParamKey in pathParams.keys) {
    uri = uri.replaceAll(
      ':$pathParamKey',
      pathParams[pathParamKey]!,
    );
  }
  uri += encodeQuery(queryParams);
  return uri;
}
