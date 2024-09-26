
import 'package:get/get.dart';
import 'package:tmdb_viewer/data/api/movie_api.dart';
import 'package:tmdb_viewer/data/repository/movie_repository.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_api.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_repo.dart';
import 'package:tmdb_viewer/ui/movies/movies_controller.dart';

class MoviesBinding extends Binding {
  @override
  List<Bind> dependencies() => [
    Bind.put<IMovieApi>(MovieApi(Bind.find())),
    Bind.put<IMovieRepo>(MovieRepository(Bind.find())),
    Bind.put<MoviesController>(MoviesController(Bind.find()))
  ];

}