

import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../app_controller.dart';
import '../data/api/_remote/i_network_handler.dart';
import '../data/api/_remote/network_handler.dart';
import '../data/api/movie_api.dart';
import '../data/dao/_base/app_database.dart';
import '../data/repository/movie_repository.dart';
import '../data/shared_preferences/i_shared_prefs.dart';
import '../data/shared_preferences/shared_prefs.dart';
import '../domain/movie/i_movie_api.dart';
import '../domain/movie/i_movie_repo.dart';

class MainBinding {

  static List<Bind> dependencies() {
    return [
      Bind.put<ISharedPrefs>(SharedPrefs(), permanent: true),
      Bind.put<AppDatabase>(AppDatabase.instance, permanent: true),
      Bind.put<INetworkHandler>(NetworkHandler(), permanent: true),
      Bind.put<IMovieApi>(MovieApi(Bind.find()), permanent: true),
      Bind.put<IMovieRepo>(MovieRepository(Bind.find()), permanent: true),
      Bind.put(AppController(), permanent: true)
    ];
  }

}
