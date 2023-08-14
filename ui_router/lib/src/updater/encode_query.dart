import 'package:ui_router/src/updater/allowed_chars.dart';

String encodeQuery(Map<String, String> queryParams) {
  String queryString = '';
  queryParams.forEach((key, value) {
    if (queryString.isEmpty) {
      queryString +=
          '?${_encodeQueryComponent(key)}=${_encodeQueryComponent(value)}';
    } else {
      queryString +=
          '&${_encodeQueryComponent(key)}=${_encodeQueryComponent(value)}';
    }
  });
  return queryString;
}

String _encodeQueryComponent(String component) {
  final StringBuffer encoded = StringBuffer();
  for (int i = 0; i < component.length; i++) {
    String char = component[i];
    if (allowedChars.contains(char)) {
      encoded.write(char);
    } else {
      encoded.write('%${char.codeUnitAt(0).toRadixString(16)}');
    }
  }
  return encoded.toString();
}
