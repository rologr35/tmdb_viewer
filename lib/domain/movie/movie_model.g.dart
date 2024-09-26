// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: (json['id'] as num).toInt(),
      backdropPath: json['backdrop_path'] as String,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: DateTime.parse(json['release_date'] as String),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate.toIso8601String(),
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
