

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_viewer/domain/genre/genre_model.dart';
import 'package:tmdb_viewer/domain/actor/actor_model.dart';

import 'movie_model.dart';
part 'movie_wrapper.g.dart';
part 'movie_wrapper.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class MovieWrapper with _$MovieWrapper {
  const factory MovieWrapper({
    required List<Genre> genres,
    required List<Actor> cast,
    required Movie movie
  }) = _MovieWrapper;

  factory MovieWrapper.fromJson(Map<String, Object?> json)
  => _$MovieWrapperFromJson(json);
}