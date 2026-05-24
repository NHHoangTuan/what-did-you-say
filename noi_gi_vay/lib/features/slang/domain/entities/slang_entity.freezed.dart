// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slang_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SlangEntity {
  String get id;
  String get phrase;
  String get meaning;
  String get origin;
  List<String> get examples;
  List<String> get tags;
  TrendLevel get trendLevel;
  DateTime get addedDate;

  /// Create a copy of SlangEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SlangEntityCopyWith<SlangEntity> get copyWith =>
      _$SlangEntityCopyWithImpl<SlangEntity>(this as SlangEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SlangEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            const DeepCollectionEquality().equals(other.examples, examples) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.trendLevel, trendLevel) ||
                other.trendLevel == trendLevel) &&
            (identical(other.addedDate, addedDate) ||
                other.addedDate == addedDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      phrase,
      meaning,
      origin,
      const DeepCollectionEquality().hash(examples),
      const DeepCollectionEquality().hash(tags),
      trendLevel,
      addedDate);

  @override
  String toString() {
    return 'SlangEntity(id: $id, phrase: $phrase, meaning: $meaning, origin: $origin, examples: $examples, tags: $tags, trendLevel: $trendLevel, addedDate: $addedDate)';
  }
}

/// @nodoc
abstract mixin class $SlangEntityCopyWith<$Res> {
  factory $SlangEntityCopyWith(
          SlangEntity value, $Res Function(SlangEntity) _then) =
      _$SlangEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String phrase,
      String meaning,
      String origin,
      List<String> examples,
      List<String> tags,
      TrendLevel trendLevel,
      DateTime addedDate});
}

/// @nodoc
class _$SlangEntityCopyWithImpl<$Res> implements $SlangEntityCopyWith<$Res> {
  _$SlangEntityCopyWithImpl(this._self, this._then);

  final SlangEntity _self;
  final $Res Function(SlangEntity) _then;

  /// Create a copy of SlangEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phrase = null,
    Object? meaning = null,
    Object? origin = null,
    Object? examples = null,
    Object? tags = null,
    Object? trendLevel = null,
    Object? addedDate = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phrase: null == phrase
          ? _self.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _self.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      examples: null == examples
          ? _self.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      trendLevel: null == trendLevel
          ? _self.trendLevel
          : trendLevel // ignore: cast_nullable_to_non_nullable
              as TrendLevel,
      addedDate: null == addedDate
          ? _self.addedDate
          : addedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _SlangEntity implements SlangEntity {
  const _SlangEntity(
      {required this.id,
      required this.phrase,
      required this.meaning,
      required this.origin,
      required final List<String> examples,
      required final List<String> tags,
      required this.trendLevel,
      required this.addedDate})
      : _examples = examples,
        _tags = tags;

  @override
  final String id;
  @override
  final String phrase;
  @override
  final String meaning;
  @override
  final String origin;
  final List<String> _examples;
  @override
  List<String> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final TrendLevel trendLevel;
  @override
  final DateTime addedDate;

  /// Create a copy of SlangEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SlangEntityCopyWith<_SlangEntity> get copyWith =>
      __$SlangEntityCopyWithImpl<_SlangEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SlangEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            const DeepCollectionEquality().equals(other._examples, _examples) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.trendLevel, trendLevel) ||
                other.trendLevel == trendLevel) &&
            (identical(other.addedDate, addedDate) ||
                other.addedDate == addedDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      phrase,
      meaning,
      origin,
      const DeepCollectionEquality().hash(_examples),
      const DeepCollectionEquality().hash(_tags),
      trendLevel,
      addedDate);

  @override
  String toString() {
    return 'SlangEntity(id: $id, phrase: $phrase, meaning: $meaning, origin: $origin, examples: $examples, tags: $tags, trendLevel: $trendLevel, addedDate: $addedDate)';
  }
}

/// @nodoc
abstract mixin class _$SlangEntityCopyWith<$Res>
    implements $SlangEntityCopyWith<$Res> {
  factory _$SlangEntityCopyWith(
          _SlangEntity value, $Res Function(_SlangEntity) _then) =
      __$SlangEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String phrase,
      String meaning,
      String origin,
      List<String> examples,
      List<String> tags,
      TrendLevel trendLevel,
      DateTime addedDate});
}

/// @nodoc
class __$SlangEntityCopyWithImpl<$Res> implements _$SlangEntityCopyWith<$Res> {
  __$SlangEntityCopyWithImpl(this._self, this._then);

  final _SlangEntity _self;
  final $Res Function(_SlangEntity) _then;

  /// Create a copy of SlangEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? phrase = null,
    Object? meaning = null,
    Object? origin = null,
    Object? examples = null,
    Object? tags = null,
    Object? trendLevel = null,
    Object? addedDate = null,
  }) {
    return _then(_SlangEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phrase: null == phrase
          ? _self.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _self.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      examples: null == examples
          ? _self._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      trendLevel: null == trendLevel
          ? _self.trendLevel
          : trendLevel // ignore: cast_nullable_to_non_nullable
              as TrendLevel,
      addedDate: null == addedDate
          ? _self.addedDate
          : addedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
