
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../res/values/constants.dart';
part 'author_details.freezed.dart';
part 'author_details.g.dart';


@freezed
class AuthorDetails with _$AuthorDetails {
  const factory AuthorDetails({
    required String name,
    required String username,
    required int rating,
    @JsonKey(name: AppConstants.avatarPath) required String? avatarPath
  }) = _AuthorDetails;

  factory AuthorDetails.fromJson(Map<String, Object?> json)
  => _$AuthorDetailsFromJson(json);
}