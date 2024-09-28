

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../res/values/constants.dart';
import 'author_details.dart';
import 'movie_model.dart';

part 'movie_reviews.freezed.dart';
part 'movie_reviews.g.dart';

@freezed
class MovieReview with _$MovieReview {
  const factory MovieReview({
    required String author,
    @JsonKey(name: AppConstants.createdAt) @DateTimeConverter() required DateTime? createdAt,
    @JsonKey(name: AppConstants.updatedAt) @DateTimeConverter() required DateTime? updatedAt,
    required String url,
    required String id,
    required String content,
    @JsonKey(name: AppConstants.authorDetails) required AuthorDetails authorDetails
  }) = _MovieReview;

  factory MovieReview.fromJson(Map<String, Object?> json)
  => _$MovieReviewFromJson(json);
}