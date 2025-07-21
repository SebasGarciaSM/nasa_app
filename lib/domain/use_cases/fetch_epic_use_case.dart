import 'package:nasa_app/domain/entities/epic_entity.dart';
import 'package:nasa_app/domain/repositories/epic_repository.dart';

class FetchEpicUseCase {
  final EpicRepository repository;

  FetchEpicUseCase(this.repository);

  Future<List<EpicEntity>> call() {
    return repository.fetchEpic();
  }
}
