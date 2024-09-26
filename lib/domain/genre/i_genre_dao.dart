

import 'package:tmdb_viewer/domain/genre/genre_model.dart';

import '../../res/values/config.dart';

abstract class IGenreDao {

  Future<bool> addMovieGenres(List<Genre> genres, AppLocale locale);

  Future<List<Genre>> getMovieGenres(AppLocale locale);
}