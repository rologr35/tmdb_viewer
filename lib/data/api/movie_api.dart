

import 'package:tmdb_viewer/data/api/_base/_base_api.dart';
import 'package:tmdb_viewer/data/api/_remote/endpoints.dart';
import 'package:tmdb_viewer/data/api/_remote/i_network_handler.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_api.dart';
import 'package:tmdb_viewer/domain/movie/movie_details.dart';
import 'package:tmdb_viewer/domain/movie/movie_results.dart';
import 'package:tmdb_viewer/domain/movie/movie_reviews.dart';
import 'package:tmdb_viewer/res/values/config.dart';
import 'package:tmdb_viewer/res/values/constants.dart';

import '../../domain/movie/movie_model.dart';

class MovieApi extends BaseApi implements IMovieApi {
  final INetworkHandler _networkHandler;

  MovieApi(this._networkHandler);

  @override
  Future<PageResults<Movie>> getTrendingMovies(AppLocale locale, {int page = 1}) async {
    final res = await _networkHandler.get(path: "${Endpoint.trendingMoviesDay}?page=$page&language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return PageResults<Movie>.fromJson(res.body, Movie.fromJson);
    }
    throw serverException(res);
  }

  @override
  Future<PageResults<Movie>> getComingSoon(AppLocale locale, {int page = 1}) async {
    final res = await _networkHandler.get(path: "${Endpoint.comingSoon}?page=$page&language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return PageResults<Movie>.fromJson(res.body, Movie.fromJson);
    }
    throw serverException(res);
  }

  @override
  Future<PageResults<Movie>> getNowPlaying(AppLocale locale, {int page = 1}) async {
    final res = await _networkHandler.get(path: "${Endpoint.nowPlaying}?page=$page&language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return PageResults<Movie>.fromJson(res.body, Movie.fromJson);
    }
    throw serverException(res);
  }

  @override
  Future<PageResults<Movie>> getTopRated(AppLocale locale, {int page = 1}) async {
    final res = await _networkHandler.get(path: "${Endpoint.topRated}?page=$page&language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return PageResults<Movie>.fromJson(res.body, Movie.fromJson);
    }
    throw serverException(res);
  }

  @override
  Future<PageResults<Movie>> getPopular(AppLocale locale, {int page = 1}) async {
    final res = await _networkHandler.get(path: "${Endpoint.popular}?page=$page&language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return PageResults<Movie>.fromJson(res.body, Movie.fromJson);
    }
    throw serverException(res);
  }

  @override
  Future<MovieDetails> getMovieDetails(AppLocale locale, int movieId) async {
    final res = await _networkHandler.get(path: Endpoint.details(movieId, locale.localeCode));
    if(res.statusCode == AppConstants.codeSuccess) {
      return MovieDetails.fromJson(res.body);
    }
    throw serverException(res);
  }

  @override
  Future<PageResults<Movie>> getMoviesByGenre(AppLocale locale, List<int> genreIds, {int page = 1}) async {
    final genres = Uri.encodeQueryComponent(genreIds.join(','));
    final res = await _networkHandler.get(path: "${Endpoint.discover}?language=${locale.localeCode}&page=$page&with_genres=$genres");
    if(res.statusCode == AppConstants.codeSuccess) {
      return PageResults<Movie>.fromJson(res.body, Movie.fromJson);
    }
    throw serverException(res);
  }

  @override
  Future<PageResults<Movie>> getMoviesByQuery(AppLocale locale, String query, {int page = 1}) async {
    final res = await _networkHandler.get(path: "${Endpoint.search}?query=$query&language=${locale.localeCode}&page=$page");
    if(res.statusCode == AppConstants.codeSuccess) {
      return PageResults<Movie>.fromJson(res.body, Movie.fromJson);
    }
    throw serverException(res);
  }

  @override
  Future<PageResults<Movie>> getSimilar(AppLocale locale, int movieId, {int page = 1}) async {
    final res = await _networkHandler.get(path: Endpoint.similar(movieId, locale.localeCode, page));
    if(res.statusCode == AppConstants.codeSuccess) {
      return PageResults<Movie>.fromJson(res.body, Movie.fromJson);
    }
    throw serverException(res);
  }

  @override
  Future<PageResults<MovieReview>> getReviews(AppLocale locale, int movieId, {int page = 1}) async {
    final res = await _networkHandler.get(path: Endpoint.reviews(movieId, locale.localeCode, page));
    if(res.statusCode == AppConstants.codeSuccess) {
      return PageResults<MovieReview>.fromJson(res.body, MovieReview.fromJson);
    }
    throw serverException(res);
  }

}