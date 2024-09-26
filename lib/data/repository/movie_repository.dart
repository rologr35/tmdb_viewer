
import 'package:tmdb_viewer/data/repository/_base/base_repository.dart';
import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_api.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_repo.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/res/values/config.dart';

class MovieRepository extends BaseRepository implements IMovieRepo {
  final IMovieApi _movieApi;

  MovieRepository(this._movieApi);

  @override
  Future<Result<List<Movie>>> getTrendingMovies(AppLocale locale) async {
    try {
      final res = await _movieApi.getTrendingMovies(locale);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<List<Movie>>> getComingSoon(AppLocale locale) async {
    try {
      final res = await _movieApi.getComingSoon(locale);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying(AppLocale locale) async {
    try {
      final res = await _movieApi.getNowPlaying(locale);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<Map<int, List<Movie>>>> getPopular(AppLocale locale, {int page = 1}) async {
    try {
      final res = await _movieApi.getPopular(locale, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRated(AppLocale locale) async {
    try {
      final res = await _movieApi.getTopRated(locale);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }


}