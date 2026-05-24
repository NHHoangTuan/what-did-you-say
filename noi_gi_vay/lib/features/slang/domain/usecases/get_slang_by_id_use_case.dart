import '../entities/slang_entity.dart';
import '../repositories/slang_repository.dart';

/// UseCase: Lấy một slang entry theo id
class GetSlangByIdUseCase {
  const GetSlangByIdUseCase(this._repository);

  final SlangRepository _repository;

  Future<SlangEntity?> call(String id) {
    return _repository.getSlangById(id);
  }
}
