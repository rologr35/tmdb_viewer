// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.backdropPath)
  String? get backdropPath => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.originalTitle)
  String get originalTitle => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.posterPath)
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.genreIds)
  List<int> get genreIds => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.releaseDate)
  DateTime get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.voteAverage)
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.voteCount)
  int get voteCount => throw _privateConstructorUsedError;

  /// Serializes this Movie to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: AppConstants.backdropPath) String? backdropPath,
      String title,
      @JsonKey(name: AppConstants.originalTitle) String originalTitle,
      String overview,
      @JsonKey(name: AppConstants.posterPath) String? posterPath,
      @JsonKey(name: AppConstants.genreIds) List<int> genreIds,
      double popularity,
      @JsonKey(name: AppConstants.releaseDate) DateTime releaseDate,
      @JsonKey(name: AppConstants.voteAverage) double voteAverage,
      @JsonKey(name: AppConstants.voteCount) int voteCount});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backdropPath = freezed,
    Object? title = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? genreIds = null,
    Object? popularity = null,
    Object? releaseDate = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: null == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieImplCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$MovieImplCopyWith(
          _$MovieImpl value, $Res Function(_$MovieImpl) then) =
      __$$MovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: AppConstants.backdropPath) String? backdropPath,
      String title,
      @JsonKey(name: AppConstants.originalTitle) String originalTitle,
      String overview,
      @JsonKey(name: AppConstants.posterPath) String? posterPath,
      @JsonKey(name: AppConstants.genreIds) List<int> genreIds,
      double popularity,
      @JsonKey(name: AppConstants.releaseDate) DateTime releaseDate,
      @JsonKey(name: AppConstants.voteAverage) double voteAverage,
      @JsonKey(name: AppConstants.voteCount) int voteCount});
}

/// @nodoc
class __$$MovieImplCopyWithImpl<$Res>
    extends _$MovieCopyWithImpl<$Res, _$MovieImpl>
    implements _$$MovieImplCopyWith<$Res> {
  __$$MovieImplCopyWithImpl(
      _$MovieImpl _value, $Res Function(_$MovieImpl) _then)
      : super(_value, _then);

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backdropPath = freezed,
    Object? title = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? genreIds = null,
    Object? popularity = null,
    Object? releaseDate = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(_$MovieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: null == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieImpl implements _Movie {
  const _$MovieImpl(
      {required this.id,
      @JsonKey(name: AppConstants.backdropPath) required this.backdropPath,
      required this.title,
      @JsonKey(name: AppConstants.originalTitle) required this.originalTitle,
      required this.overview,
      @JsonKey(name: AppConstants.posterPath) required this.posterPath,
      @JsonKey(name: AppConstants.genreIds) required final List<int> genreIds,
      required this.popularity,
      @JsonKey(name: AppConstants.releaseDate) required this.releaseDate,
      @JsonKey(name: AppConstants.voteAverage) required this.voteAverage,
      @JsonKey(name: AppConstants.voteCount) required this.voteCount})
      : _genreIds = genreIds;

  factory _$MovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: AppConstants.backdropPath)
  final String? backdropPath;
  @override
  final String title;
  @override
  @JsonKey(name: AppConstants.originalTitle)
  final String originalTitle;
  @override
  final String overview;
  @override
  @JsonKey(name: AppConstants.posterPath)
  final String? posterPath;
  final List<int> _genreIds;
  @override
  @JsonKey(name: AppConstants.genreIds)
  List<int> get genreIds {
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreIds);
  }

  @override
  final double popularity;
  @override
  @JsonKey(name: AppConstants.releaseDate)
  final DateTime releaseDate;
  @override
  @JsonKey(name: AppConstants.voteAverage)
  final double voteAverage;
  @override
  @JsonKey(name: AppConstants.voteCount)
  final int voteCount;

  @override
  String toString() {
    return 'Movie(id: $id, backdropPath: $backdropPath, title: $title, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, genreIds: $genreIds, popularity: $popularity, releaseDate: $releaseDate, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      backdropPath,
      title,
      originalTitle,
      overview,
      posterPath,
      const DeepCollectionEquality().hash(_genreIds),
      popularity,
      releaseDate,
      voteAverage,
      voteCount);

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      __$$MovieImplCopyWithImpl<_$MovieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieImplToJson(
      this,
    );
  }
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {required final int id,
      @JsonKey(name: AppConstants.backdropPath)
      required final String? backdropPath,
      required final String title,
      @JsonKey(name: AppConstants.originalTitle)
      required final String originalTitle,
      required final String overview,
      @JsonKey(name: AppConstants.posterPath) required final String? posterPath,
      @JsonKey(name: AppConstants.genreIds) required final List<int> genreIds,
      required final double popularity,
      @JsonKey(name: AppConstants.releaseDate)
      required final DateTime releaseDate,
      @JsonKey(name: AppConstants.voteAverage)
      required final double voteAverage,
      @JsonKey(name: AppConstants.voteCount)
      required final int voteCount}) = _$MovieImpl;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$MovieImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: AppConstants.backdropPath)
  String? get backdropPath;
  @override
  String get title;
  @override
  @JsonKey(name: AppConstants.originalTitle)
  String get originalTitle;
  @override
  String get overview;
  @override
  @JsonKey(name: AppConstants.posterPath)
  String? get posterPath;
  @override
  @JsonKey(name: AppConstants.genreIds)
  List<int> get genreIds;
  @override
  double get popularity;
  @override
  @JsonKey(name: AppConstants.releaseDate)
  DateTime get releaseDate;
  @override
  @JsonKey(name: AppConstants.voteAverage)
  double get voteAverage;
  @override
  @JsonKey(name: AppConstants.voteCount)
  int get voteCount;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
