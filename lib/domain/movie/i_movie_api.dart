
import 'package:tmdb_viewer/domain/movie/movie_results.dart';
import 'package:tmdb_viewer/res/values/config.dart';

import 'movie_details.dart';

abstract class IMovieApi {

  Future<MovieResults> getTrendingMovies(AppLocale locale, {int page});

  Future<MovieResults> getNowPlaying(AppLocale locale, {int page});

  Future<MovieResults> getComingSoon(AppLocale locale, {int page});

  Future<MovieResults> getTopRated(AppLocale locale, {int page});

  Future<MovieResults> getPopular(AppLocale locale, {int page});

  Future<MovieDetails> getMovieDetails(AppLocale locale, int movieId);

  Future<MovieResults> getMoviesByGenre(AppLocale locale, List<int> genreIds, {int page});

  Future<MovieResults> getMoviesByQuery(AppLocale locale, String query, {int page});
}