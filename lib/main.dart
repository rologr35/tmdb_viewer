import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tmdb_viewer/app.dart';
import 'package:tmdb_viewer/utils/logger.dart';

void main() {
  runZonedGuarded<void>(() {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (error) => Logger.log(error);

    runApp(const TmdbViewerApp(
      title: "TMDB Viewer",
    ));
  }, (error, stack) =>
      Logger.log("$error: \n$stack"));
}