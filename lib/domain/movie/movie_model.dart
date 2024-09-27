
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_viewer/utils/extensions.dart';
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
    required bool video,
    @JsonKey(name: AppConstants.releaseDate) @DateTimeConverter() required DateTime? releaseDate,
    @JsonKey(name: AppConstants.voteAverage) required double voteAverage,
    @JsonKey(name: AppConstants.voteCount) required int voteCount
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json)
  => _$MovieFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    return json.isNullOrEmpty() ? null : DateFormat('yyyy-MM-dd').parse(json!);
  }

  @override
  String? toJson(DateTime? dateTime) {
    return dateTime == null ? null : DateFormat('yyyy-MM-dd').format(dateTime);
  }
}