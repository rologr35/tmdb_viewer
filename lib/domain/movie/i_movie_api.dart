
import 'package:tmdb_viewer/res/values/config.dart';

import 'movie_model.dart';

abstract class IMovieApi {

  Future<List<Movie>> getTrendingMovies(AppLocale locale);

  Future<List<Movie>> getNowPlaying(AppLocale locale);

  Future<List<Movie>> getComingSoon(AppLocale locale);

  Future<List<Movie>> getTopRated(AppLocale locale);

  Future<List<Movie>> getPopular(AppLocale locale);
}