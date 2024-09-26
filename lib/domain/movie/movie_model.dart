
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../res/values/constants.dart';
part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    @JsonKey(name: AppConstants.backdropPath) required String? backdropPath,
    required String title,
    @JsonKey(name: AppConstants.originalTitle) required String originalTitle,
    required String overview,
    @JsonKey(name: AppConstants.posterPath) required String? posterPath,
    @JsonKey(name: AppConstants.genreIds) required List<int> genreIds,
    required double popularity,
    @JsonKey(name: AppConstants.releaseDate) required DateTime releaseDate,
    @JsonKey(name: AppConstants.voteAverage) required double voteAverage,
    @JsonKey(name: AppConstants.voteCount) required int voteCount
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json)
  => _$MovieFromJson(json);
}