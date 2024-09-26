

import 'package:tmdb_viewer/data/api/_base/_base_api.dart';
import 'package:tmdb_viewer/data/api/_remote/endpoints.dart';
import 'package:tmdb_viewer/data/api/_remote/i_network_handler.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_api.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/res/values/config.dart';
import 'package:tmdb_viewer/res/values/constants.dart';

class MovieApi extends BaseApi implements IMovieApi {
  final INetworkHandler _networkHandler;

  MovieApi(this._networkHandler);

  @override
  Future<List<Movie>> getTrendingMovies(AppLocale locale) async {
    final res = await _networkHandler.get(path: "${Endpoint.trendingMoviesDay}?language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return (res.body['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList();
    }
    throw serverException(res);
  }

  @override
  Future<List<Movie>> getComingSoon(AppLocale locale) async {
    final res = await _networkHandler.get(path: "${Endpoint.comingSoon}?language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return (res.body['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList();
    }
    throw serverException(res);
  }

  @override
  Future<List<Movie>> getNowPlaying(AppLocale locale) async {
    final res = await _networkHandler.get(path: "${Endpoint.nowPlaying}?language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return (res.body['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList();
    }
    throw serverException(res);
  }

  @override
  Future<List<Movie>> getTopRated(AppLocale locale) async {
    final res = await _networkHandler.get(path: "${Endpoint.topRated}?language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return (res.body['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList();
    }
    throw serverException(res);
  }

  @override
  Future<Map<int, List<Movie>>> getPopular(AppLocale locale, {int page = 1}) async {
    final res = await _networkHandler.get(path: "${Endpoint.popular}?page=$page&language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return {
        res.body['total_pages']: (res.body['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList()
      };
    }
    throw serverException(res);
  }

}