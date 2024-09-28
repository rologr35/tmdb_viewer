
import 'package:tmdb_viewer/data/repository/_base/base_repository.dart';
import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_api.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_repo.dart';
import 'package:tmdb_viewer/domain/movie/movie_details.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/domain/movie/movie_reviews.dart';
import 'package:tmdb_viewer/res/values/config.dart';

import '../../domain/movie/movie_results.dart';

class MovieRepository extends BaseRepository implements IMovieRepo {
  final IMovieApi _movieApi;

  MovieRepository(this._movieApi);

  @override
  Future<Result<PageResults<Movie>>> getTrendingMovies(AppLocale locale, {int page = 1}) async {
    try {
      final res = await _movieApi.getTrendingMovies(locale, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<PageResults<Movie>>> getComingSoon(AppLocale locale, {int page = 1}) async {
    try {
      final res = await _movieApi.getComingSoon(locale, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<PageResults<Movie>>> getNowPlaying(AppLocale locale, {int page = 1}) async {
    try {
      final res = await _movieApi.getNowPlaying(locale, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<PageResults<Movie>>> getPopular(AppLocale locale, {int page = 1}) async {
    try {
      final res = await _movieApi.getPopular(locale, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<PageResults<Movie>>> getTopRated(AppLocale locale, {int page = 1}) async {
    try {
      final res = await _movieApi.getTopRated(locale, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<MovieDetails>> getMovieDetails(AppLocale locale, int movieId) async {
    try {
      final res = await _movieApi.getMovieDetails(locale, movieId);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<PageResults<Movie>>> getMoviesByGenre(AppLocale locale, List<int> genreIds, {int page = 1}) async {
    try {
      final res = await _movieApi.getMoviesByGenre(locale, genreIds, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<PageResults<Movie>>> getMoviesByQuery(AppLocale locale, String query, {int page = 1}) async {
    try {
      final res = await _movieApi.getMoviesByQuery(locale, query, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<PageResults<MovieReview>>> getReviews(AppLocale locale, int movieId, {int page = 1}) async {
    try {
      final res = await _movieApi.getReviews(locale, movieId, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<PageResults<Movie>>> getSimilar(AppLocale locale, int movieId, {int page = 1}) async {
    try {
      final res = await _movieApi.getSimilar(locale, movieId, page: page);
      return ResultSuccess(value: res);
    } catch(ex) {
      return resultError(ex);
    }
  }

}