
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/domain/movie/movie_results.dart';
import 'package:tmdb_viewer/domain/movie/movie_reviews.dart';
import 'package:tmdb_viewer/res/values/config.dart';

import 'movie_details.dart';

abstract class IMovieApi {

  Future<PageResults<Movie>> getTrendingMovies(AppLocale locale, {int page});

  Future<PageResults<Movie>> getNowPlaying(AppLocale locale, {int page});

  Future<PageResults<Movie>> getComingSoon(AppLocale locale, {int page});

  Future<PageResults<Movie>> getTopRated(AppLocale locale, {int page});

  Future<PageResults<Movie>> getPopular(AppLocale locale, {int page});

  Future<MovieDetails> getMovieDetails(AppLocale locale, int movieId);

  Future<PageResults<Movie>> getMoviesByGenre(AppLocale locale, List<int> genreIds, {int page});

  Future<PageResults<Movie>> getMoviesByQuery(AppLocale locale, String query, {int page});

  Future<PageResults<Movie>> getSimilar(AppLocale locale, int movieId, {int page});

  Future<PageResults<MovieReview>> getReviews(AppLocale locale, int movieId, {int page});
}