

import 'package:tmdb_viewer/domain/movie/movie_details.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/res/values/config.dart';

import '../../data/repository/_base/result.dart';
import 'movie_results.dart';

abstract class IMovieRepo {

  Future<Result<MovieResults>> getTrendingMovies(AppLocale locale, {int page});

  Future<Result<MovieResults>> getNowPlaying(AppLocale locale, {int page});

  Future<Result<MovieResults>> getComingSoon(AppLocale locale, {int page});

  Future<Result<MovieResults>> getTopRated(AppLocale locale, {int page});

  Future<Result<MovieResults>> getPopular(AppLocale locale, {int page});

  Future<Result<MovieDetails>> getMovieDetails(AppLocale locale, int movieId);

  Future<Result<MovieResults>> getMoviesByGenre(AppLocale locale, List<int> genreIds, {int page});

  Future<Result<MovieResults>> getMoviesByQuery(AppLocale locale, String query, {int page});
}