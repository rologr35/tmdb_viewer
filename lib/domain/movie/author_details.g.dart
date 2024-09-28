// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorDetailsImpl _$$AuthorDetailsImplFromJson(Map<String, dynamic> json) =>
    _$AuthorDetailsImpl(
      name: json['name'] as String,
      username: json['username'] as String,
      rating: (json['rating'] as num).toInt(),
      avatarPath: json['avatar_path'] as String?,
    );

Map<String, dynamic> _$$AuthorDetailsImplToJson(_$AuthorDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'rating': instance.rating,
      'avatar_path': instance.avatarPath,
    };
