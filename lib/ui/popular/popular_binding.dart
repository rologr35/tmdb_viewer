
import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/popular/popular_controller.dart';

import '../../data/api/movie_api.dart';
import '../../data/repository/movie_repository.dart';
import '../../domain/movie/i_movie_api.dart';
import '../../domain/movie/i_movie_repo.dart';

class PopularBinding extends Binding {
  @override
  List<Bind> dependencies() => [
    Bind.put<PopularController>(PopularController(Bind.find()), permanent: true)
  ];

}