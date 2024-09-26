

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../res/values/constants.dart';
part 'actor_model.freezed.dart';
part 'actor_model.g.dart';

@freezed
class Actor with _$Actor {
  const factory Actor({
    required int id,
    required int order,
    @JsonKey(name: AppConstants.castId) required int castId,
    required String name,
    @JsonKey(name: AppConstants.originalName) required String originalName,
    @JsonKey(name: AppConstants.profilePath) required String profilePath,
    required String character
  }) = _Actor;

  factory Actor.fromJson(Map<String, Object?> json)
  => _$ActorFromJson(json);

}