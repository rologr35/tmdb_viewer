// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailsImpl _$$MovieDetailsImplFromJson(Map<String, dynamic> json) =>
    _$MovieDetailsImpl(
      budget: (json['budget'] as num).toDouble(),
      revenue: (json['revenue'] as num).toDouble(),
      homepage: json['homepage'] as String?,
      runtime: (json['runtime'] as num).toInt(),
    );

Map<String, dynamic> _$$MovieDetailsImplToJson(_$MovieDetailsImpl instance) =>
    <String, dynamic>{
      'budget': instance.budget,
      'revenue': instance.revenue,
      'homepage': instance.homepage,
      'runtime': instance.runtime,
    };
