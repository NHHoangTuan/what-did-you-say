import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/slang_entity.dart';

part 'slang_model.freezed.dart';
part 'slang_model.g.dart';

/// Custom converter: String → TrendLevel
/// Xử lý cả "new" (cũ trong JSON) → TrendLevel.rising
class _TrendLevelConverter implements JsonConverter<TrendLevel, String> {
  const _TrendLevelConverter();

  @override
  TrendLevel fromJson(String json) {
    switch (json) {
      case 'hot':
        return TrendLevel.hot;
      case 'rising':
      case 'new':
        return TrendLevel.rising;
      case 'classic':
        return TrendLevel.classic;
      default:
        return TrendLevel.rising;
    }
  }

  @override
  String toJson(TrendLevel object) => object.name;
}

/// Custom converter: "YYYY-MM-DD" string → DateTime
class _DateConverter implements JsonConverter<DateTime, String> {
  const _DateConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) =>
      '${object.year}-${object.month.toString().padLeft(2, '0')}-${object.day.toString().padLeft(2, '0')}';
}

/// Data model cho slang entry — parse từ JSON, convert sang domain entity
@freezed
sealed class SlangModel with _$SlangModel {
  const SlangModel._();

  const factory SlangModel({
    required String id,
    required String phrase,
    required String meaning,
    required String origin,
    required List<String> examples,
    required List<String> tags,
    @_TrendLevelConverter() required TrendLevel trendLevel,
    @_DateConverter() required DateTime addedDate,
  }) = _SlangModel;

  factory SlangModel.fromJson(Map<String, dynamic> json) =>
      _$SlangModelFromJson(json);

  /// Convert sang domain entity — data layer không bocal ra ngoài domain
  SlangEntity toEntity() => SlangEntity(
        id: id,
        phrase: phrase,
        meaning: meaning,
        origin: origin,
        examples: examples,
        tags: tags,
        trendLevel: trendLevel,
        addedDate: addedDate,
      );
}
