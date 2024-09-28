// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_reviews.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieReview _$MovieReviewFromJson(Map<String, dynamic> json) {
  return _MovieReview.fromJson(json);
}

/// @nodoc
mixin _$MovieReview {
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.createdAt)
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.updatedAt)
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: AppConstants.authorDetails)
  AuthorDetails get authorDetails => throw _privateConstructorUsedError;

  /// Serializes this MovieReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieReviewCopyWith<MovieReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieReviewCopyWith<$Res> {
  factory $MovieReviewCopyWith(
          MovieReview value, $Res Function(MovieReview) then) =
      _$MovieReviewCopyWithImpl<$Res, MovieReview>;
  @useResult
  $Res call(
      {String author,
      @JsonKey(name: AppConstants.createdAt)
      @DateTimeConverter()
      DateTime? createdAt,
      @JsonKey(name: AppConstants.updatedAt)
      @DateTimeConverter()
      DateTime? updatedAt,
      String url,
      String id,
      String content,
      @JsonKey(name: AppConstants.authorDetails) AuthorDetails authorDetails});

  $AuthorDetailsCopyWith<$Res> get authorDetails;
}

/// @nodoc
class _$MovieReviewCopyWithImpl<$Res, $Val extends MovieReview>
    implements $MovieReviewCopyWith<$Res> {
  _$MovieReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url = null,
    Object? id = null,
    Object? content = null,
    Object? authorDetails = null,
  }) {
    return _then(_value.copyWith(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorDetails: null == authorDetails
          ? _value.authorDetails
          : authorDetails // ignore: cast_nullable_to_non_nullable
              as AuthorDetails,
    ) as $Val);
  }

  /// Create a copy of MovieReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthorDetailsCopyWith<$Res> get authorDetails {
    return $AuthorDetailsCopyWith<$Res>(_value.authorDetails, (value) {
      return _then(_value.copyWith(authorDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieReviewImplCopyWith<$Res>
    implements $MovieReviewCopyWith<$Res> {
  factory _$$MovieReviewImplCopyWith(
          _$MovieReviewImpl value, $Res Function(_$MovieReviewImpl) then) =
      __$$MovieReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String author,
      @JsonKey(name: AppConstants.createdAt)
      @DateTimeConverter()
      DateTime? createdAt,
      @JsonKey(name: AppConstants.updatedAt)
      @DateTimeConverter()
      DateTime? updatedAt,
      String url,
      String id,
      String content,
      @JsonKey(name: AppConstants.authorDetails) AuthorDetails authorDetails});

  @override
  $AuthorDetailsCopyWith<$Res> get authorDetails;
}

/// @nodoc
class __$$MovieReviewImplCopyWithImpl<$Res>
    extends _$MovieReviewCopyWithImpl<$Res, _$MovieReviewImpl>
    implements _$$MovieReviewImplCopyWith<$Res> {
  __$$MovieReviewImplCopyWithImpl(
      _$MovieReviewImpl _value, $Res Function(_$MovieReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url = null,
    Object? id = null,
    Object? content = null,
    Object? authorDetails = null,
  }) {
    return _then(_$MovieReviewImpl(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorDetails: null == authorDetails
          ? _value.authorDetails
          : authorDetails // ignore: cast_nullable_to_non_nullable
              as AuthorDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieReviewImpl implements _MovieReview {
  const _$MovieReviewImpl(
      {required this.author,
      @JsonKey(name: AppConstants.createdAt)
      @DateTimeConverter()
      required this.createdAt,
      @JsonKey(name: AppConstants.updatedAt)
      @DateTimeConverter()
      required this.updatedAt,
      required this.url,
      required this.id,
      required this.content,
      @JsonKey(name: AppConstants.authorDetails) required this.authorDetails});

  factory _$MovieReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieReviewImplFromJson(json);

  @override
  final String author;
  @override
  @JsonKey(name: AppConstants.createdAt)
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(name: AppConstants.updatedAt)
  @DateTimeConverter()
  final DateTime? updatedAt;
  @override
  final String url;
  @override
  final String id;
  @override
  final String content;
  @override
  @JsonKey(name: AppConstants.authorDetails)
  final AuthorDetails authorDetails;

  @override
  String toString() {
    return 'MovieReview(author: $author, createdAt: $createdAt, updatedAt: $updatedAt, url: $url, id: $id, content: $content, authorDetails: $authorDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieReviewImpl &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorDetails, authorDetails) ||
                other.authorDetails == authorDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, author, createdAt, updatedAt,
      url, id, content, authorDetails);

  /// Create a copy of MovieReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieReviewImplCopyWith<_$MovieReviewImpl> get copyWith =>
      __$$MovieReviewImplCopyWithImpl<_$MovieReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieReviewImplToJson(
      this,
    );
  }
}

abstract class _MovieReview implements MovieReview {
  const factory _MovieReview(
      {required final String author,
      @JsonKey(name: AppConstants.createdAt)
      @DateTimeConverter()
      required final DateTime? createdAt,
      @JsonKey(name: AppConstants.updatedAt)
      @DateTimeConverter()
      required final DateTime? updatedAt,
      required final String url,
      required final String id,
      required final String content,
      @JsonKey(name: AppConstants.authorDetails)
      required final AuthorDetails authorDetails}) = _$MovieReviewImpl;

  factory _MovieReview.fromJson(Map<String, dynamic> json) =
      _$MovieReviewImpl.fromJson;

  @override
  String get author;
  @override
  @JsonKey(name: AppConstants.createdAt)
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(name: AppConstants.updatedAt)
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  String get url;
  @override
  String get id;
  @override
  String get content;
  @override
  @JsonKey(name: AppConstants.authorDetails)
  AuthorDetails get authorDetails;

  /// Create a copy of MovieReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieReviewImplCopyWith<_$MovieReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
