

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_viewer/domain/genre/genre_model.dart';
import 'package:tmdb_viewer/domain/actor/actor_model.dart';

import 'movie_details.dart';
import 'movie_model.dart';
part 'movie_wrapper.g.dart';
part 'movie_wrapper.freezed.dart';

@unfreezed
class MovieWrapper with _$MovieWrapper {
  factory MovieWrapper({
    required List<Genre> genres,
    List<Actor>? cast,
    MovieDetails? movieDetails,
    required Movie movie
  }) = _MovieWrapper;

  factory MovieWrapper.fromJson(Map<String, Object?> json)
  => _$MovieWrapperFromJson(json);
}