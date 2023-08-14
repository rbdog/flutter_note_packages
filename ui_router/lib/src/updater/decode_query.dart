Map<String, String> decodeQuery(String queryString) {
  Map<String, String> result = {};
  List<String> queryParts = queryString.split('&');
  for (String part in queryParts) {
    List<String> pair = part.split('=');
    String key = Uri.decodeQueryComponent(pair[0]);
    String value = Uri.decodeQueryComponent(pair[1]);
    result[key] = value;
  }
  return result;
}
