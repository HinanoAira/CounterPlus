import 'dart:convert';
import 'dart:io' as io;
import 'package:universal_html/html.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_platform/universal_platform.dart';

Future<String> get _localPath async {
  if (io.Platform.isWindows) {
    Map<String, String> envVars = io.Platform.environment;
    final appDataDirectory = io.Directory(
        '${envVars['LOCALAPPDATA']?.replaceAll('\\', '/')}/hinasense/hinacounterplus');
    await appDataDirectory.create(recursive: true);

    return appDataDirectory.path;
  }
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<io.File> get _localFile async {
  final path = await _localPath;
  return io.File('$path/counters.json');
}

Future<Map<String, dynamic>?> loadCounters() async {
  try {
    String jsonString;
    if (UniversalPlatform.isWeb) {
      jsonString = window.localStorage['counters']!;
    } else {
      final file = await _localFile;
      jsonString = await file.readAsString();
    }

    return jsonDecode(jsonString);
  } catch (e) {
    return null;
  }
}

Future<bool> saveCounters(Map<String, dynamic> jsonData) async {
  try {
    final String jsonString = jsonEncode(jsonData);
    if (UniversalPlatform.isWeb) {
      window.localStorage['counters'] = jsonString;
    } else {
      final file = await _localFile;
      await file.writeAsString(jsonString);
    }

    return true;
  } catch (e) {
    return false;
  }
}
