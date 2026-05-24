import 'package:freezed_annotation/freezed_annotation.dart';

part 'slang_entity.freezed.dart';

/// Mức độ trending của một slang
enum TrendLevel {
  hot,      // 🔥 Đang hot
  rising,   // ⚡ Mới nổi
  classic,  // 📦 Cổ điển
}

extension TrendLevelExtension on TrendLevel {
  String get emoji {
    switch (this) {
      case TrendLevel.hot:
        return '🔥';
      case TrendLevel.rising:
        return '⚡';
      case TrendLevel.classic:
        return '📦';
    }
  }

  String get label {
    switch (this) {
      case TrendLevel.hot:
        return 'Đang hot';
      case TrendLevel.rising:
        return 'Mới nổi';
      case TrendLevel.classic:
        return 'Cổ điển';
    }
  }
}

/// Entity đại diện cho một từ/cụm từ slang trong domain layer
@freezed
sealed class SlangEntity with _$SlangEntity {
  const factory SlangEntity({
    required String id,
    required String phrase,
    required String meaning,
    required String origin,
    required List<String> examples,
    required List<String> tags,
    required TrendLevel trendLevel,
    required DateTime addedDate,
  }) = _SlangEntity;
}
