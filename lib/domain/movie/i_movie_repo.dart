

import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/res/values/config.dart';

import '../../data/repository/_base/result.dart';

abstract class IMovieRepo {

  Future<Result<List<Movie>>> getTrendingMovies(AppLocale locale);

  Future<Result<List<Movie>>> getNowPlaying(AppLocale locale);

  Future<Result<List<Movie>>> getComingSoon(AppLocale locale);

  Future<Result<List<Movie>>> getTopRated(AppLocale locale);

  Future<Result<List<Movie>>> getPopular(AppLocale locale);
}