import 'package:nasa_app/domain/entities/asteroid_entity.dart';

abstract class AsteroidsRepository {
  Future<List<AsteroidEntity>> fetchAsteroids({
    required String startDate,
    required String endDate,
  });
}
