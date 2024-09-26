
import 'package:tmdb_viewer/data/repository/_base/base_repository.dart';
import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/domain/genre/genre_model.dart';
import 'package:tmdb_viewer/domain/genre/i_genre_api.dart';
import 'package:tmdb_viewer/domain/genre/i_genre_dao.dart';
import 'package:tmdb_viewer/domain/genre/i_genre_repo.dart';
import 'package:tmdb_viewer/res/values/config.dart';

class GenreRepository extends BaseRepository implements IGenreRepo {
  final IGenreApi _genreApi;
  final IGenreDao _genreDao;

  GenreRepository(this._genreApi, this._genreDao);

  @override
  Future<Result<List<Genre>>> getMovieGenres(AppLocale locale, {bool local = false}) async {
    try {
      return ResultSuccess(value: local
          ? await _genreDao.getMovieGenres(locale)
          : await _genreApi.getMovieGenres(locale));
    } catch(ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<bool>> addMovieGenres(List<Genre> genres, AppLocale locale) async {
    try {
      return ResultSuccess(value: await _genreDao.addMovieGenres(genres, locale));
    } catch(ex) {
      return resultError(ex);
    }
  }

}