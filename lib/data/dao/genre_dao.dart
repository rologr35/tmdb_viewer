
import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:tmdb_viewer/data/dao/_base/app_database.dart';
import 'package:tmdb_viewer/data/dao/_base/db_constants.dart';
import 'package:tmdb_viewer/domain/genre/genre_model.dart';
import 'package:tmdb_viewer/domain/genre/i_genre_dao.dart';
import 'package:tmdb_viewer/res/values/config.dart';

import '../../utils/logger.dart';

class GenreDao implements IGenreDao {

  @override
  Future<bool> addMovieGenres(List<Genre> genres, AppLocale locale) async {
    try {
      Database db = await AppDatabase.instance.db;
      final batch = db.batch();
      for(var genre in genres) {
        final map = {
          DBConstants.idKey: genre.id,
          DBConstants.dataKey: jsonEncode(genre.toJson()),
          DBConstants.localeKey: locale.localeCode
        };
        batch.insert(DBConstants.genresTable, map,
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch
          .commit(noResult: true, continueOnError: true)
          .onError((error, stackTrace) {
        throw Exception(error);
      });
      return true;
    } catch(ex) {
      Logger.log(ex);
      return false;
    }
  }

  @override
  Future<List<Genre>> getMovieGenres(AppLocale locale) async {
    final List<Genre> result = [];
    try {
      Database db = await AppDatabase.instance.db;
      await db.transaction((txn) async {
        QueryCursor? cursor;
        try {
          cursor = await txn
              .queryCursor(DBConstants.genresTable,
              where: '${DBConstants.localeKey} = ?',
              whereArgs: [locale.localeCode],
          )
              .onError((error, stackTrace) {
            throw Exception(error);
          });
          while (await cursor.moveNext()) {
            final String value = cursor.current[DBConstants.dataKey] as String;
            result.add(Genre.fromJson(jsonDecode(value)));
          }
        } catch (ex) {
          Logger.log(ex);
        } finally {
          cursor?.close();
        }
      });
    } catch(ex) {
      Logger.log(ex);
    }
    return result;
  }

}