/// Interface định nghĩa các operations với favorites list
/// Implementation dùng Hive để lưu local
abstract class FavoritesRepository {
  /// Lấy danh sách id các slang đã lưu
  Future<List<String>> getFavoriteIds();

  /// Kiểm tra một slang có trong favorites không
  Future<bool> isFavorite(String slangId);

  /// Thêm vào favorites nếu chưa có, xóa nếu đã có
  Future<void> toggleFavorite(String slangId);

  /// Xóa khỏi favorites
  Future<void> removeFavorite(String slangId);

  /// Xóa toàn bộ favorites
  Future<void> clearFavorites();

  /// Stream để watch thay đổi realtime (optional — dùng cho reactive UI)
  Stream<List<String>> watchFavoriteIds();
}
