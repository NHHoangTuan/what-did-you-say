import 'package:hive/hive.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/hive_constants.dart';

/// Data source lưu lịch sử tìm kiếm vào Hive
class RecentSearchesDataSource {
  Box<String> get _box => Hive.box<String>(HiveConstants.recentSearchesBox);

  /// Lấy toàn bộ recent searches (mới nhất trước)
  List<String> getRecentSearches() {
    // Hive lưu theo insertion order, reverse để mới nhất lên đầu
    return _box.values.toList().reversed.toList();
  }

  /// Thêm một query vào recent searches
  /// - Không thêm query rỗng
  /// - Xóa duplicate cũ trước khi thêm mới
  /// - Giới hạn [AppConstants.maxRecentSearches] entries
  Future<void> addSearch(String query) async {
    final q = query.trim();
    if (q.isEmpty) return;

    // Xóa duplicate cũ nếu có
    final existingKey = _box.keys.cast<dynamic>().firstWhere(
      (k) => _box.get(k) == q,
      orElse: () => null,
    );
    if (existingKey != null) {
      await _box.delete(existingKey);
    }

    // Thêm mới vào cuối (sẽ hiện đầu tiên khi reverse)
    await _box.add(q);

    // Cắt bớt nếu vượt limit: xóa entry cũ nhất (đầu box)
    while (_box.length > AppConstants.maxRecentSearches) {
      final oldestKey = _box.keys.first;
      await _box.delete(oldestKey);
    }
  }

  /// Xóa một query cụ thể
  Future<void> removeSearch(String query) async {
    final key = _box.keys.cast<dynamic>().firstWhere(
      (k) => _box.get(k) == query,
      orElse: () => null,
    );
    if (key != null) {
      await _box.delete(key);
    }
  }

  /// Xóa toàn bộ lịch sử
  Future<void> clearAll() async {
    await _box.clear();
  }
}
