

import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/res/values/config.dart';

import 'actor_model.dart';

abstract class IActorRepository {

  Future<Result<List<Actor>>> getMovieCast(int movieId, AppLocale locale);
}