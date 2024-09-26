// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieWrapperImpl _$$MovieWrapperImplFromJson(Map<String, dynamic> json) =>
    _$MovieWrapperImpl(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Actor.fromJson(e as Map<String, dynamic>))
          .toList(),
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MovieWrapperImplToJson(_$MovieWrapperImpl instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'cast': instance.cast,
      'movie': instance.movie,
    };
