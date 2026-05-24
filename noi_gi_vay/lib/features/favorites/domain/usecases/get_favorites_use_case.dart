import '../repositories/favorites_repository.dart';

/// UseCase: Lấy danh sách id các slang đã lưu
class GetFavoritesUseCase {
  const GetFavoritesUseCase(this._repository);

  final FavoritesRepository _repository;

  Future<List<String>> call() {
    return _repository.getFavoriteIds();
  }

  /// Watch stream để UI cập nhật realtime
  Stream<List<String>> watch() {
    return _repository.watchFavoriteIds();
  }
}
