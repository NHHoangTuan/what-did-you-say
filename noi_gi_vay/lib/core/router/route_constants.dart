/// Tên các route trong app
class RouteConstants {
  RouteConstants._();

  static const String home = '/';
  static const String search = '/search';
  static const String detail = '/slang/:id';
  static const String favorites = '/favorites';
  static const String about = '/about';

  // Helper để build path detail với id cụ thể
  static String detailPath(String id) => '/slang/$id';
}
