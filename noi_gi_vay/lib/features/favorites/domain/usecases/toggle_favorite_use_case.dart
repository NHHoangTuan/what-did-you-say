import '../repositories/favorites_repository.dart';

/// UseCase: Toggle favorite — thêm nếu chưa có, xóa nếu đã có
class ToggleFavoriteUseCase {
  const ToggleFavoriteUseCase(this._repository);

  final FavoritesRepository _repository;

  Future<void> call(String slangId) {
    return _repository.toggleFavorite(slangId);
  }
}
