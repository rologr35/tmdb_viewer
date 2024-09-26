
import 'package:tmdb_viewer/data/repository/_base/base_repository.dart';
import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/domain/actor/actor_model.dart';
import 'package:tmdb_viewer/domain/actor/i_actor_api.dart';
import 'package:tmdb_viewer/domain/actor/i_actor_repository.dart';
import 'package:tmdb_viewer/res/values/config.dart';

class ActorRepository extends BaseRepository implements IActorRepository {
  final IActorApi _actorApi;

  ActorRepository(this._actorApi);

  @override
  Future<Result<List<Actor>>> getMovieCast(int movieId, AppLocale locale) async {
    try {
      return ResultSuccess(value: await _actorApi.getMovieCast(movieId, locale));
    } catch(ex) {
      return resultError(ex);
    }
  }

}