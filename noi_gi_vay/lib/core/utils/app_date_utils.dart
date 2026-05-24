/// Tiện ích xử lý ngày tháng
class AppDateUtils {
  AppDateUtils._();

  /// Trả về chuỗi hiển thị ngày thêm slang (vd: "24 tháng 5, 2026")
  static String formatAddedDate(DateTime date) {
    const months = [
      '', 'tháng 1', 'tháng 2', 'tháng 3', 'tháng 4',
      'tháng 5', 'tháng 6', 'tháng 7', 'tháng 8',
      'tháng 9', 'tháng 10', 'tháng 11', 'tháng 12',
    ];
    return '${date.day} ${months[date.month]}, ${date.year}';
  }

  /// Kiểm tra xem hôm nay có phải ngày mới so với [cachedDate] không
  static bool isNewDay(DateTime cachedDate) {
    final now = DateTime.now();
    return now.year != cachedDate.year ||
        now.month != cachedDate.month ||
        now.day != cachedDate.day;
  }

  /// Trả về chuỗi YYYY-MM-DD từ DateTime (dùng làm key cache)
  static String toDateKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
