import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/favorites_repository.dart';
import '../../data/datasources/favorites_local_data_source.dart';
import '../../data/repositories/favorites_repository_impl.dart';

part 'favorites_providers.g.dart';

// --- Infrastructure ---

@riverpod
FavoritesLocalDataSource favoritesLocalDataSource(Ref ref) {
  final ds = FavoritesLocalDataSource();
  ref.onDispose(ds.dispose);
  return ds;
}

@riverpod
FavoritesRepository favoritesRepository(Ref ref) {
  return FavoritesRepositoryImpl(ref.watch(favoritesLocalDataSourceProvider));
}

// --- Notifier: quản lý trạng thái favorites ---

/// AsyncNotifier quản lý danh sách favorites IDs
/// UI dùng provider này để toggle và check
@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  Future<Set<String>> build() async {
    final repo = ref.watch(favoritesRepositoryProvider);
    final ids = await repo.getFavoriteIds();
    return ids.toSet();
  }

  /// Toggle favorite — thêm nếu chưa có, xóa nếu đã có
  Future<void> toggle(String slangId) async {
    await ref.read(favoritesRepositoryProvider).toggleFavorite(slangId);
    ref.invalidateSelf();
  }

  /// Xóa toàn bộ favorites
  Future<void> clear() async {
    await ref.read(favoritesRepositoryProvider).clearFavorites();
    ref.invalidateSelf();
  }
}

/// Helper provider: kiểm tra nhanh một slang có trong favorites không
@riverpod
bool isFavorite(Ref ref, String slangId) {
  final favs = ref.watch(favoritesNotifierProvider);
  return favs.maybeWhen(
    data: (ids) => ids.contains(slangId),
    orElse: () => false,
  );
}
