import 'package:nasa_app/domain/entities/asteroid_entity.dart';
import 'package:nasa_app/domain/repositories/asteroids_repository.dart';

class FetchAsteroidsUseCase {
  final AsteroidsRepository repository;

  FetchAsteroidsUseCase(this.repository);

  Future<List<AsteroidEntity>> call({
    required String startDate,
    required String endDate,
  }) {
    return repository.fetchAsteroids(
      startDate: startDate,
      endDate: endDate,
    );
  }
}
