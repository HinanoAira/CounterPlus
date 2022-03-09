import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counters.json');
}

Future<Map<String, dynamic>?> loadCounters() async {
  try {
    final file = await _localFile;
    String jsonString = await file.readAsString();

    return jsonDecode(jsonString);
  } catch (e) {
    return null;
  }
}

Future<bool> saveCounters(Map<String, dynamic> jsonData) async {
  try {
    String jsonString = jsonEncode(jsonData);

    final file = await _localFile;
    await file.writeAsString(jsonString);
    return true;
  } catch (e) {
    return false;
  }
}
