import 'package:flutter/foundation.dart';

String assetPath(path) {
  return kIsWeb && !kDebugMode ? 'assets/$path' : path;
}
