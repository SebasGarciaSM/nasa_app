import 'package:nasa_app/domain/entities/apod_entity.dart';
import 'package:nasa_app/domain/repositories/apod_repository.dart';

class FetchApodUseCase {
  final ApodRepository repository;

  FetchApodUseCase(this.repository);

  Future<ApodEntity> call() {
    return repository.fetchApod();
  }
}
