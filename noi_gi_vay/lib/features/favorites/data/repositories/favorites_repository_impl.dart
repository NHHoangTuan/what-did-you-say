import '../../domain/repositories/favorites_repository.dart';
import '../datasources/favorites_local_data_source.dart';

/// Implement FavoritesRepository — delegate cho FavoritesLocalDataSource
class FavoritesRepositoryImpl implements FavoritesRepository {
  const FavoritesRepositoryImpl(this._dataSource);

  final FavoritesLocalDataSource _dataSource;

  @override
  Future<List<String>> getFavoriteIds() async {
    return _dataSource.getFavoriteIds();
  }

  @override
  Future<bool> isFavorite(String slangId) async {
    return _dataSource.isFavorite(slangId);
  }

  @override
  Future<void> toggleFavorite(String slangId) async {
    await _dataSource.toggleFavorite(slangId);
  }

  @override
  Future<void> removeFavorite(String slangId) async {
    await _dataSource.removeFavorite(slangId);
  }

  @override
  Future<void> clearFavorites() async {
    await _dataSource.clearFavorites();
  }

  @override
  Stream<List<String>> watchFavoriteIds() {
    return _dataSource.watchFavoriteIds();
  }
}
