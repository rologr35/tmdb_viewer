// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieWrapper _$MovieWrapperFromJson(Map<String, dynamic> json) {
  return _MovieWrapper.fromJson(json);
}

/// @nodoc
mixin _$MovieWrapper {
  List<Genre> get genres => throw _privateConstructorUsedError;
  List<Actor> get cast => throw _privateConstructorUsedError;
  Movie get movie => throw _privateConstructorUsedError;

  /// Serializes this MovieWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieWrapperCopyWith<MovieWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieWrapperCopyWith<$Res> {
  factory $MovieWrapperCopyWith(
          MovieWrapper value, $Res Function(MovieWrapper) then) =
      _$MovieWrapperCopyWithImpl<$Res, MovieWrapper>;
  @useResult
  $Res call({List<Genre> genres, List<Actor> cast, Movie movie});

  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class _$MovieWrapperCopyWithImpl<$Res, $Val extends MovieWrapper>
    implements $MovieWrapperCopyWith<$Res> {
  _$MovieWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
    Object? cast = null,
    Object? movie = null,
  }) {
    return _then(_value.copyWith(
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      cast: null == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Actor>,
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ) as $Val);
  }

  /// Create a copy of MovieWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get movie {
    return $MovieCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieWrapperImplCopyWith<$Res>
    implements $MovieWrapperCopyWith<$Res> {
  factory _$$MovieWrapperImplCopyWith(
          _$MovieWrapperImpl value, $Res Function(_$MovieWrapperImpl) then) =
      __$$MovieWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Genre> genres, List<Actor> cast, Movie movie});

  @override
  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$MovieWrapperImplCopyWithImpl<$Res>
    extends _$MovieWrapperCopyWithImpl<$Res, _$MovieWrapperImpl>
    implements _$$MovieWrapperImplCopyWith<$Res> {
  __$$MovieWrapperImplCopyWithImpl(
      _$MovieWrapperImpl _value, $Res Function(_$MovieWrapperImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
    Object? cast = null,
    Object? movie = null,
  }) {
    return _then(_$MovieWrapperImpl(
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      cast: null == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Actor>,
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieWrapperImpl implements _MovieWrapper {
  const _$MovieWrapperImpl(
      {required this.genres, required this.cast, required this.movie});

  factory _$MovieWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieWrapperImplFromJson(json);

  @override
  final List<Genre> genres;
  @override
  final List<Actor> cast;
  @override
  final Movie movie;

  @override
  String toString() {
    return 'MovieWrapper(genres: $genres, cast: $cast, movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieWrapperImpl &&
            const DeepCollectionEquality().equals(other.genres, genres) &&
            const DeepCollectionEquality().equals(other.cast, cast) &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(genres),
      const DeepCollectionEquality().hash(cast),
      movie);

  /// Create a copy of MovieWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieWrapperImplCopyWith<_$MovieWrapperImpl> get copyWith =>
      __$$MovieWrapperImplCopyWithImpl<_$MovieWrapperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieWrapperImplToJson(
      this,
    );
  }
}

abstract class _MovieWrapper implements MovieWrapper {
  const factory _MovieWrapper(
      {required final List<Genre> genres,
      required final List<Actor> cast,
      required final Movie movie}) = _$MovieWrapperImpl;

  factory _MovieWrapper.fromJson(Map<String, dynamic> json) =
      _$MovieWrapperImpl.fromJson;

  @override
  List<Genre> get genres;
  @override
  List<Actor> get cast;
  @override
  Movie get movie;

  /// Create a copy of MovieWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieWrapperImplCopyWith<_$MovieWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
