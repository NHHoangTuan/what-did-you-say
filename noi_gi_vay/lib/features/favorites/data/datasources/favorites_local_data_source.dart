import 'dart:async';

import 'package:hive/hive.dart';

import '../../../../core/constants/hive_constants.dart';

/// Data source lưu favorites (slang IDs) vào Hive local storage
class FavoritesLocalDataSource {
  Box<String> get _box => Hive.box<String>(HiveConstants.favoritesBox);

  final _controller = StreamController<List<String>>.broadcast();

  /// Lấy tất cả slang ID đã lưu
  List<String> getFavoriteIds() => _box.values.toList();

  /// Kiểm tra một slang có trong favorites không
  bool isFavorite(String slangId) => _box.values.contains(slangId);

  /// Toggle: thêm nếu chưa có, xóa nếu đã có
  Future<void> toggleFavorite(String slangId) async {
    if (isFavorite(slangId)) {
      final key = _box.keys.firstWhere((k) => _box.get(k) == slangId);
      await _box.delete(key);
    } else {
      await _box.add(slangId);
    }
    _controller.add(getFavoriteIds());
  }

  /// Xóa một slang khỏi favorites
  Future<void> removeFavorite(String slangId) async {
    final key = _box.keys.firstWhere(
      (k) => _box.get(k) == slangId,
      orElse: () => null,
    );
    if (key != null) {
      await _box.delete(key);
      _controller.add(getFavoriteIds());
    }
  }

  /// Xóa toàn bộ favorites
  Future<void> clearFavorites() async {
    await _box.clear();
    _controller.add([]);
  }

  /// Stream để watch thay đổi realtime
  Stream<List<String>> watchFavoriteIds() => _controller.stream;

  void dispose() => _controller.close();
}
