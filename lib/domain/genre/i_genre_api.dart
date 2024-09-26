
import 'package:tmdb_viewer/domain/genre/genre_model.dart';

import '../../res/values/config.dart';

abstract class IGenreApi {

  Future<List<Genre>> getMovieGenres(AppLocale locale);
}