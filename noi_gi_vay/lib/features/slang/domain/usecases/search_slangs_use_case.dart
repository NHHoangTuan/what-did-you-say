import '../entities/slang_entity.dart';
import '../repositories/slang_repository.dart';

/// UseCase: Tìm kiếm slang theo từ khóa
class SearchSlangsUseCase {
  const SearchSlangsUseCase(this._repository);

  final SlangRepository _repository;

  Future<List<SlangEntity>> call(String query) {
    return _repository.searchSlangs(query);
  }
}
