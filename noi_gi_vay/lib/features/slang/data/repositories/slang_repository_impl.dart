import '../../domain/entities/slang_entity.dart';
import '../../domain/repositories/slang_repository.dart';
import '../datasources/slang_asset_data_source.dart';

/// Implement SlangRepository — delegate toàn bộ cho SlangAssetDataSource
class SlangRepositoryImpl implements SlangRepository {
  const SlangRepositoryImpl(this._dataSource);

  final SlangAssetDataSource _dataSource;

  @override
  Future<List<SlangEntity>> getAllSlangs() async {
    final models = await _dataSource.getAllSlangs();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<SlangEntity>> searchSlangs(String query) async {
    final models = await _dataSource.searchSlangs(query);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<SlangEntity?> getSlangById(String id) async {
    final model = await _dataSource.getSlangById(id);
    return model?.toEntity();
  }

  @override
  Future<List<SlangEntity>> getTrendingSlangs({int limit = 20}) async {
    final models = await _dataSource.getTrendingSlangs(limit: limit);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<SlangEntity> getSlangOfDay() async {
    final model = await _dataSource.getSlangOfDay();
    return model.toEntity();
  }
}
