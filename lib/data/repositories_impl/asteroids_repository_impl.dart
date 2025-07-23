// ignore_for_file: avoid_print

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa_app/core/network/http_validator.dart';
import 'package:nasa_app/data/models/neart_earth_object_response.dart';
import 'package:nasa_app/domain/entities/asteroid_entity.dart';
import 'package:nasa_app/domain/repositories/asteroids_repository.dart';

class AsteroidsRepositoryImpl implements AsteroidsRepository {
  final apiKey = dotenv.env['API_KEY']!;

  @override
  Future<List<AsteroidEntity>> fetchAsteroids({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final url = Uri.https('api.nasa.gov', '/neo/rest/v1/feed', {
        'start_date': startDate,
        'end_date': endDate,
        'api_key': apiKey,
      });

      final response = await HttpValidator.get(url);
      final json = HttpValidator.validateResponse(response);
      final model = NearEarthObjectResponse.fromJson(json);
      var list = model.asteroids.map((element) => element.toEntity()).toList();
      return list;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
