
import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/movies/movies_controller.dart';

class MoviesBinding extends Binding {
  @override
  List<Bind> dependencies() => [
    Bind.put<MoviesController>(MoviesController(Bind.find()), permanent: true)
  ];

}