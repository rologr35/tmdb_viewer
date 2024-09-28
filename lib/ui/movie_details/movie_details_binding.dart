
import 'package:get/get.dart';
import 'package:tmdb_viewer/data/api/actor_api.dart';
import 'package:tmdb_viewer/data/repository/actor_repository.dart';
import 'package:tmdb_viewer/domain/actor/i_actor_api.dart';
import 'package:tmdb_viewer/domain/actor/i_actor_repository.dart';
import 'package:tmdb_viewer/ui/movie_details/movie_details_controller.dart';

class MovieDetailsBinding extends Binding {
  @override
  List<Bind> dependencies() => [
    Bind.put<IActorApi>(ActorApi(Bind.find())),
    Bind.put<IActorRepository>(ActorRepository(Bind.find())),
    Bind.put<MovieDetailsController>(MovieDetailsController(Bind.find(), Bind.find()))
  ];

}