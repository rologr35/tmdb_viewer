

import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/movies/components/trending_movies/trending_movies_controller.dart';

class TrendingMoviesBinding extends Binding {
  @override
  List<Bind> dependencies() => [
    Bind.put<TrendingMoviesController>(TrendingMoviesController())
  ];

}