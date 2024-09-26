
import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/favorites/favorites_controller.dart';

class FavoritesBinding extends Binding {
  @override
  List<Bind> dependencies() => [
    Bind.put<FavoritesController>(FavoritesController())
  ];

}