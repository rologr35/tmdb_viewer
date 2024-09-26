
import 'package:tmdb_viewer/res/values/config.dart';

import '../../data/repository/_base/result.dart';
import 'genre_model.dart';

abstract class IGenreRepo {

  Future<Result<List<Genre>>> getMovieGenres(AppLocale locale, {bool local});

  Future<Result<bool>> addMovieGenres(List<Genre> genres, AppLocale locale);
}