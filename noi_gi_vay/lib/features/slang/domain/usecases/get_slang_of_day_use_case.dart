import '../entities/slang_entity.dart';
import '../repositories/slang_repository.dart';

/// UseCase: Lấy "Slang hôm nay" — thay đổi mỗi ngày
class GetSlangOfDayUseCase {
  const GetSlangOfDayUseCase(this._repository);

  final SlangRepository _repository;

  Future<SlangEntity> call() {
    return _repository.getSlangOfDay();
  }
}
