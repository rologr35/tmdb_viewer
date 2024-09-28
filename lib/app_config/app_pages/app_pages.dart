import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/home/home_binding.dart';
import 'package:tmdb_viewer/ui/home/home_page.dart';
import 'package:tmdb_viewer/ui/movie_details/movie_details_binding.dart';
import 'package:tmdb_viewer/ui/movie_details/movie_details_page.dart';
import 'package:tmdb_viewer/ui/movies/movies_binding.dart';
import 'package:tmdb_viewer/ui/movies/movies_page.dart';
import 'package:tmdb_viewer/ui/popular/popular_binding.dart';
import 'package:tmdb_viewer/ui/popular/popular_page.dart';
import 'package:tmdb_viewer/ui/search/search_binding.dart';
import 'package:tmdb_viewer/ui/search/search_page.dart';

import '../../ui/splash/splash_binding.dart';
import '../../ui/splash/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  static AppPages? _instance;

  AppPages._();

  static AppPages get instance {
    _instance ??= AppPages._();
    return _instance!;
  }

  String get homeRoot => _Paths.home;
  String get splash => _Paths.splash;
  String get movies => "$homeRoot${_Paths.movies}";
  String get popular => "$homeRoot${_Paths.popular}";
  String get search => "$homeRoot${_Paths.search}";

  List<GetPage> get pages => [
        GetPage(
            name: _Paths.splash,
            page: () => SplashPage(),
            binding: SplashBinding()),
        GetPage(
            name: _Paths.home,
            participatesInRootNavigator: true,
            transition: Transition.noTransition,
            binding: HomeBinding(),
            page: () => HomePage(),
            children: [
              GetPage(
                  name: _Paths.search,
                  page: () => SearchPage(),
                  transition: Transition.fadeIn,
                  binding: SearchBinding()),
              GetPage(
                  name: _Paths.movies,
                  page: () => MoviesPage(),
                  binding: MoviesBinding(),
                  transition: Transition.fadeIn,
                  children: [
                    GetPage(name: '/:id', page: () => MovieDetailsPage(), binding: MovieDetailsBinding())
                  ]
              ),
              GetPage(
                  name: _Paths.popular,
                  page: () => PopularPage(),
                  binding: PopularBinding(),
                  transition: Transition.fadeIn)
            ])
      ];
}
