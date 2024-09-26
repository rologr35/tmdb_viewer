
import 'package:get/get.dart';
import 'package:tmdb_viewer/ui/popular/popular_controller.dart';

class PopularBinding extends Binding {
  @override
  List<Bind> dependencies() => [
    Bind.put<PopularController>(PopularController())
  ];

}