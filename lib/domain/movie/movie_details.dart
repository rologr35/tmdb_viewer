

import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_details.g.dart';
part 'movie_details.freezed.dart';

@freezed
class MovieDetails with _$MovieDetails {

  factory MovieDetails({
    required double budget,
    required double revenue,
    required String? homepage,
    required int runtime
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, Object?> json)
  => _$MovieDetailsFromJson(json);
}