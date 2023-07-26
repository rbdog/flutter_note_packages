import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Uint8List> getImageBytesAsset(String path) async {
  WidgetsFlutterBinding.ensureInitialized();
  final byteData = await rootBundle.load(path);
  final uint8List = Uint8List.view(byteData.buffer);
  return uint8List;
}
