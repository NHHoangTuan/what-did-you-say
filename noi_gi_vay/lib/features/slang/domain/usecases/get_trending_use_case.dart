import '../entities/slang_entity.dart';
import '../repositories/slang_repository.dart';

/// UseCase: Lấy danh sách slang trending
class GetTrendingUseCase {
  const GetTrendingUseCase(this._repository);

  final SlangRepository _repository;

  Future<List<SlangEntity>> call({int limit = 20}) {
    return _repository.getTrendingSlangs(limit: limit);
  }
}
