
import 'package:tmdb_viewer/domain/actor/actor_model.dart';
import 'package:tmdb_viewer/res/values/config.dart';

abstract class IActorApi {

  Future<List<Actor>> getMovieCast(int movieId, AppLocale locale);
}