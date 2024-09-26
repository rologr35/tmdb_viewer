
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tmdb_viewer/app_config/app_pages/app_pages.dart';
import 'package:tmdb_viewer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tmdb_viewer/res/values/theme.dart';

import 'app_config/main_binding.dart';

class TmdbViewerApp extends StatelessWidget {
  final String title;

  const TmdbViewerApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!,
        );
      },
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: title,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      highContrastTheme: AppTheme.lightTheme,
      highContrastDarkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppPages.instance.splash,
      binds: MainBinding.dependencies(),
      getPages: AppPages.instance.pages,
      debugShowCheckedModeBanner: false,
    );
  }


}
