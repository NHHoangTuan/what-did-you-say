import '../repositories/favorites_repository.dart';

/// UseCase: Kiểm tra một slang có trong favorites không
class IsFavoriteUseCase {
  const IsFavoriteUseCase(this._repository);

  final FavoritesRepository _repository;

  Future<bool> call(String slangId) {
    return _repository.isFavorite(slangId);
  }
}
