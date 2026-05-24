// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slang_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SlangModel {
  String get id;
  String get phrase;
  String get meaning;
  String get origin;
  List<String> get examples;
  List<String> get tags;
  @_TrendLevelConverter()
  TrendLevel get trendLevel;
  @_DateConverter()
  DateTime get addedDate;

  /// Create a copy of SlangModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SlangModelCopyWith<SlangModel> get copyWith =>
      _$SlangModelCopyWithImpl<SlangModel>(this as SlangModel, _$identity);

  /// Serializes this SlangModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SlangModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'SlangModel(id: $id, phrase: $phrase, meaning: $meaning, origin: $origin, examples: $examples, tags: $tags, trendLevel: $trendLevel, addedDate: $addedDate)';
  }
}

/// @nodoc
abstract mixin class $SlangModelCopyWith<$Res> {
  factory $SlangModelCopyWith(
          SlangModel value, $Res Function(SlangModel) _then) =
      _$SlangModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String phrase,
      String meaning,
      String origin,
      List<String> examples,
      List<String> tags,
      @_TrendLevelConverter() TrendLevel trendLevel,
      @_DateConverter() DateTime addedDate});
}

/// @nodoc
class _$SlangModelCopyWithImpl<$Res> implements $SlangModelCopyWith<$Res> {
  _$SlangModelCopyWithImpl(this._self, this._then);

  final SlangModel _self;
  final $Res Function(SlangModel) _then;

  /// Create a copy of SlangModel
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
@JsonSerializable()
class _SlangModel extends SlangModel {
  const _SlangModel(
      {required this.id,
      required this.phrase,
      required this.meaning,
      required this.origin,
      required final List<String> examples,
      required final List<String> tags,
      @_TrendLevelConverter() required this.trendLevel,
      @_DateConverter() required this.addedDate})
      : _examples = examples,
        _tags = tags,
        super._();
  factory _SlangModel.fromJson(Map<String, dynamic> json) =>
      _$SlangModelFromJson(json);

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
  @_TrendLevelConverter()
  final TrendLevel trendLevel;
  @override
  @_DateConverter()
  final DateTime addedDate;

  /// Create a copy of SlangModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SlangModelCopyWith<_SlangModel> get copyWith =>
      __$SlangModelCopyWithImpl<_SlangModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SlangModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SlangModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'SlangModel(id: $id, phrase: $phrase, meaning: $meaning, origin: $origin, examples: $examples, tags: $tags, trendLevel: $trendLevel, addedDate: $addedDate)';
  }
}

/// @nodoc
abstract mixin class _$SlangModelCopyWith<$Res>
    implements $SlangModelCopyWith<$Res> {
  factory _$SlangModelCopyWith(
          _SlangModel value, $Res Function(_SlangModel) _then) =
      __$SlangModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String phrase,
      String meaning,
      String origin,
      List<String> examples,
      List<String> tags,
      @_TrendLevelConverter() TrendLevel trendLevel,
      @_DateConverter() DateTime addedDate});
}

/// @nodoc
class __$SlangModelCopyWithImpl<$Res> implements _$SlangModelCopyWith<$Res> {
  __$SlangModelCopyWithImpl(this._self, this._then);

  final _SlangModel _self;
  final $Res Function(_SlangModel) _then;

  /// Create a copy of SlangModel
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
    return _then(_SlangModel(
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
