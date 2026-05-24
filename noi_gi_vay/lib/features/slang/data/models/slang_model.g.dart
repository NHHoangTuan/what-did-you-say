// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slang_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SlangModel _$SlangModelFromJson(Map<String, dynamic> json) => _SlangModel(
      id: json['id'] as String,
      phrase: json['phrase'] as String,
      meaning: json['meaning'] as String,
      origin: json['origin'] as String,
      examples:
          (json['examples'] as List<dynamic>).map((e) => e as String).toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      trendLevel:
          const _TrendLevelConverter().fromJson(json['trendLevel'] as String),
      addedDate: const _DateConverter().fromJson(json['addedDate'] as String),
    );

Map<String, dynamic> _$SlangModelToJson(_SlangModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phrase': instance.phrase,
      'meaning': instance.meaning,
      'origin': instance.origin,
      'examples': instance.examples,
      'tags': instance.tags,
      'trendLevel': const _TrendLevelConverter().toJson(instance.trendLevel),
      'addedDate': const _DateConverter().toJson(instance.addedDate),
    };
