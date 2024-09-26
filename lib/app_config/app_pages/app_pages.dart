
import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/favorites/favorites_binding.dart';
import 'package:tmdb_viewer/ui/favorites/favorites_page.dart';
import 'package:tmdb_viewer/ui/home/home_binding.dart';
import 'package:tmdb_viewer/ui/home/home_page.dart';
import 'package:tmdb_viewer/ui/movies/components/trending_movies/trending_movies_binding.dart';
import 'package:tmdb_viewer/ui/movies/movies_binding.dart';
import 'package:tmdb_viewer/ui/movies/movies_page.dart';
import 'package:tmdb_viewer/ui/popular/popular_binding.dart';
import 'package:tmdb_viewer/ui/popular/popular_page.dart';

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
  String get myList => "$homeRoot${_Paths.myList}";

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
                name: _Paths.movies,
                page: () => MoviesPage(),
                bindings: [MoviesBinding(), TrendingMoviesBinding()],
                transition: Transition.fadeIn
            ),
            GetPage(
                name: _Paths.popular,
                page: () => PopularPage(),
                binding: PopularBinding(),
                transition: Transition.fadeIn
            ),
            GetPage(
                name: _Paths.myList,
                page: () => FavoritesPage(),
                binding: FavoritesBinding(),
                transition: Transition.fadeIn
            ),
          ]
        )
  ];
}
