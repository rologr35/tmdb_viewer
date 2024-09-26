
import 'package:tmdb_viewer/data/api/_base/_base_api.dart';
import 'package:tmdb_viewer/data/api/_remote/endpoints.dart';
import 'package:tmdb_viewer/data/api/_remote/i_network_handler.dart';
import 'package:tmdb_viewer/domain/genre/genre_model.dart';
import 'package:tmdb_viewer/domain/genre/i_genre_api.dart';
import 'package:tmdb_viewer/res/values/config.dart';
import 'package:tmdb_viewer/res/values/constants.dart';

class GenreApi extends BaseApi implements IGenreApi {
  final INetworkHandler _networkHandler;
  
  GenreApi(this._networkHandler);
  
  @override
  Future<List<Genre>> getMovieGenres(AppLocale locale) async {
    final res = await _networkHandler.get(path: "${Endpoint.genres}?language=${locale.localeCode}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return (res.body['genres'] as List<dynamic>).map((e) => Genre.fromJson(e)).toList();
    }
    throw serverException(res);
  }
  
}