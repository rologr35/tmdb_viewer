

import 'package:tmdb_viewer/data/api/_base/_base_api.dart';
import 'package:tmdb_viewer/data/api/_remote/endpoints.dart';
import 'package:tmdb_viewer/data/api/_remote/i_network_handler.dart';
import 'package:tmdb_viewer/domain/actor/actor_model.dart';
import 'package:tmdb_viewer/domain/actor/i_actor_api.dart';
import 'package:tmdb_viewer/res/values/constants.dart';

import '../../res/values/config.dart';

class ActorApi extends BaseApi implements IActorApi {
  final INetworkHandler _networkHandler;
  
  ActorApi(this._networkHandler);
  
  @override
  Future<List<Actor>> getMovieCast(int movieId, AppLocale locale) async {
    final res = await _networkHandler.get(path: "${Endpoint.cast(movieId, locale.localeCode)}");
    if(res.statusCode == AppConstants.codeSuccess) {
      return (res.body['cast'] as List<dynamic>).map((e) => Actor.fromJson(e)).toList();
    }
    throw serverException(res);
  }
  
}