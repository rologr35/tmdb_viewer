import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tmdb_viewer/data/api/genre_api.dart';
import 'package:tmdb_viewer/data/dao/genre_dao.dart';
import 'package:tmdb_viewer/data/repository/genre_repository.dart';
import 'package:tmdb_viewer/domain/genre/i_genre_api.dart';
import 'package:tmdb_viewer/domain/genre/i_genre_dao.dart';
import 'package:tmdb_viewer/domain/genre/i_genre_repo.dart';
import 'package:tmdb_viewer/ui/splash/splash_controller.dart';

class SplashBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put<IGenreDao>(GenreDao()),
      Bind.put<IGenreApi>(GenreApi(Bind.find())),
      Bind.put<IGenreRepo>(GenreRepository(Bind.find(), Bind.find())),
      Bind.put<SplashController>(SplashController(Bind.find()))
    ];
  }

}