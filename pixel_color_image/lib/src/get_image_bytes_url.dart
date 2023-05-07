import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<Uint8List> getImageBytesUrl(String urlString) async {
  final url = Uri.parse(urlString);
  final http.Response response = await http.get(url);
  final uint8List = response.bodyBytes;
  return uint8List;
}
