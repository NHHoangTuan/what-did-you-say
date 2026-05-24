import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/slang_entity.dart';
import '../../domain/repositories/slang_repository.dart';
import '../../domain/usecases/get_slang_by_id_use_case.dart';
import '../../domain/usecases/get_slang_of_day_use_case.dart';
import '../../domain/usecases/get_trending_use_case.dart';
import '../../domain/usecases/search_slangs_use_case.dart';
import '../../data/datasources/slang_asset_data_source.dart';
import '../../data/repositories/slang_repository_impl.dart';

part 'slang_providers.g.dart';

// --- Infrastructure ---

@riverpod
SlangAssetDataSource slangAssetDataSource(Ref ref) {
  return SlangAssetDataSource();
}

@riverpod
SlangRepository slangRepository(Ref ref) {
  return SlangRepositoryImpl(ref.watch(slangAssetDataSourceProvider));
}

// --- Use Case Providers ---

@riverpod
SearchSlangsUseCase searchSlangsUseCase(Ref ref) {
  return SearchSlangsUseCase(ref.watch(slangRepositoryProvider));
}

@riverpod
GetSlangByIdUseCase getSlangByIdUseCase(Ref ref) {
  return GetSlangByIdUseCase(ref.watch(slangRepositoryProvider));
}

@riverpod
GetTrendingUseCase getTrendingUseCase(Ref ref) {
  return GetTrendingUseCase(ref.watch(slangRepositoryProvider));
}

@riverpod
GetSlangOfDayUseCase getSlangOfDayUseCase(Ref ref) {
  return GetSlangOfDayUseCase(ref.watch(slangRepositoryProvider));
}

// --- Data Providers ---

/// Danh sách slang trending — FutureProvider, cache tự động
@riverpod
Future<List<SlangEntity>> trendingSlangs(Ref ref) {
  return ref.watch(getTrendingUseCaseProvider).call();
}

/// Slang of the day — thay đổi mỗi ngày
@riverpod
Future<SlangEntity> slangOfDay(Ref ref) {
  return ref.watch(getSlangOfDayUseCaseProvider).call();
}

/// Tìm kiếm theo query — family provider để pass tham số
@riverpod
Future<List<SlangEntity>> slangSearch(Ref ref, String query) {
  return ref.watch(searchSlangsUseCaseProvider).call(query);
}

/// Lấy chi tiết một slang — family provider
@riverpod
Future<SlangEntity?> slangDetail(Ref ref, String id) {
  return ref.watch(getSlangByIdUseCaseProvider).call(id);
}
