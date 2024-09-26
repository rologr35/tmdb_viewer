import 'package:flutter/foundation.dart';

class Logger {
  static log(Object message) {
    if (kDebugMode) {
      print(message);
    }
  }
}

