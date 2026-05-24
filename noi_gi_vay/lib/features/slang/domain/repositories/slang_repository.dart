import '../entities/slang_entity.dart';

/// Interface định nghĩa các operations với slang data
/// Implementation sẽ nằm ở data layer
abstract class SlangRepository {
  /// Lấy tất cả slang entries
  Future<List<SlangEntity>> getAllSlangs();

  /// Tìm kiếm slang theo từ khóa (fuzzy search)
  Future<List<SlangEntity>> searchSlangs(String query);

  /// Lấy slang theo id
  Future<SlangEntity?> getSlangById(String id);

  /// Lấy danh sách slang đang trending
  Future<List<SlangEntity>> getTrendingSlangs({int limit = 20});

  /// Lấy slang of the day (dựa theo ngày hiện tại)
  Future<SlangEntity> getSlangOfDay();
}
