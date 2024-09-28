// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieReviewImpl _$$MovieReviewImplFromJson(Map<String, dynamic> json) =>
    _$MovieReviewImpl(
      author: json['author'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['created_at'] as String?),
      updatedAt:
          const DateTimeConverter().fromJson(json['updated_at'] as String?),
      url: json['url'] as String,
      id: json['id'] as String,
      content: json['content'] as String,
      authorDetails: AuthorDetails.fromJson(
          json['author_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MovieReviewImplToJson(_$MovieReviewImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeConverter().toJson(instance.updatedAt),
      'url': instance.url,
      'id': instance.id,
      'content': instance.content,
      'author_details': instance.authorDetails,
    };
