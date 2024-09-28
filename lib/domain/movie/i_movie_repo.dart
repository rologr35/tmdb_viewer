
import 'package:tmdb_viewer/domain/movie/movie_details.dart';
import 'package:tmdb_viewer/res/values/config.dart';

import '../../data/repository/_base/result.dart';
import 'movie_model.dart';
import 'movie_results.dart';
import 'movie_reviews.dart';

abstract class IMovieRepo {

  Future<Result<PageResults<Movie>>> getTrendingMovies(AppLocale locale, {int page});

  Future<Result<PageResults<Movie>>> getNowPlaying(AppLocale locale, {int page});

  Future<Result<PageResults<Movie>>> getComingSoon(AppLocale locale, {int page});

  Future<Result<PageResults<Movie>>> getTopRated(AppLocale locale, {int page});

  Future<Result<PageResults<Movie>>> getPopular(AppLocale locale, {int page});

  Future<Result<MovieDetails>> getMovieDetails(AppLocale locale, int movieId);

  Future<Result<PageResults<Movie>>> getMoviesByGenre(AppLocale locale, List<int> genreIds, {int page});

  Future<Result<PageResults<Movie>>> getMoviesByQuery(AppLocale locale, String query, {int page});

  Future<Result<PageResults<Movie>>> getSimilar(AppLocale locale, int movieId, {int page});

  Future<Result<PageResults<MovieReview>>> getReviews(AppLocale locale, int movieId, {int page});
}