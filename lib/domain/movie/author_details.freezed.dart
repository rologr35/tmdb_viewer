// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorDetails _$AuthorDetailsFromJson(Map<String, dynamic> json) {
  return _AuthorDetails.fromJson(json);
}

/// @nodoc
mixin _$AuthorDetails {
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.avatarPath)
  String? get avatarPath => throw _privateConstructorUsedError;

  /// Serializes this AuthorDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthorDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorDetailsCopyWith<AuthorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorDetailsCopyWith<$Res> {
  factory $AuthorDetailsCopyWith(
          AuthorDetails value, $Res Function(AuthorDetails) then) =
      _$AuthorDetailsCopyWithImpl<$Res, AuthorDetails>;
  @useResult
  $Res call(
      {String name,
      String username,
      int rating,
      @JsonKey(name: AppConstants.avatarPath) String? avatarPath});
}

/// @nodoc
class _$AuthorDetailsCopyWithImpl<$Res, $Val extends AuthorDetails>
    implements $AuthorDetailsCopyWith<$Res> {
  _$AuthorDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? rating = null,
    Object? avatarPath = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorDetailsImplCopyWith<$Res>
    implements $AuthorDetailsCopyWith<$Res> {
  factory _$$AuthorDetailsImplCopyWith(
          _$AuthorDetailsImpl value, $Res Function(_$AuthorDetailsImpl) then) =
      __$$AuthorDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String username,
      int rating,
      @JsonKey(name: AppConstants.avatarPath) String? avatarPath});
}

/// @nodoc
class __$$AuthorDetailsImplCopyWithImpl<$Res>
    extends _$AuthorDetailsCopyWithImpl<$Res, _$AuthorDetailsImpl>
    implements _$$AuthorDetailsImplCopyWith<$Res> {
  __$$AuthorDetailsImplCopyWithImpl(
      _$AuthorDetailsImpl _value, $Res Function(_$AuthorDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? rating = null,
    Object? avatarPath = freezed,
  }) {
    return _then(_$AuthorDetailsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorDetailsImpl implements _AuthorDetails {
  const _$AuthorDetailsImpl(
      {required this.name,
      required this.username,
      required this.rating,
      @JsonKey(name: AppConstants.avatarPath) required this.avatarPath});

  factory _$AuthorDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorDetailsImplFromJson(json);

  @override
  final String name;
  @override
  final String username;
  @override
  final int rating;
  @override
  @JsonKey(name: AppConstants.avatarPath)
  final String? avatarPath;

  @override
  String toString() {
    return 'AuthorDetails(name: $name, username: $username, rating: $rating, avatarPath: $avatarPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.avatarPath, avatarPath) ||
                other.avatarPath == avatarPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, username, rating, avatarPath);

  /// Create a copy of AuthorDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorDetailsImplCopyWith<_$AuthorDetailsImpl> get copyWith =>
      __$$AuthorDetailsImplCopyWithImpl<_$AuthorDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorDetailsImplToJson(
      this,
    );
  }
}

abstract class _AuthorDetails implements AuthorDetails {
  const factory _AuthorDetails(
      {required final String name,
      required final String username,
      required final int rating,
      @JsonKey(name: AppConstants.avatarPath)
      required final String? avatarPath}) = _$AuthorDetailsImpl;

  factory _AuthorDetails.fromJson(Map<String, dynamic> json) =
      _$AuthorDetailsImpl.fromJson;

  @override
  String get name;
  @override
  String get username;
  @override
  int get rating;
  @override
  @JsonKey(name: AppConstants.avatarPath)
  String? get avatarPath;

  /// Create a copy of AuthorDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorDetailsImplCopyWith<_$AuthorDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
