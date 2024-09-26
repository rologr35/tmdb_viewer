// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActorImpl _$$ActorImplFromJson(Map<String, dynamic> json) => _$ActorImpl(
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      castId: (json['cast_id'] as num).toInt(),
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String,
    );

Map<String, dynamic> _$$ActorImplToJson(_$ActorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'cast_id': instance.castId,
      'name': instance.name,
      'original_name': instance.originalName,
      'profile_path': instance.profilePath,
      'character': instance.character,
    };
