import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
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
    final url = Uri.https('api.nasa.gov', '/neo/rest/v1/feed', {
      'start_date': startDate,
      'end_date': endDate,
      'api_key': apiKey,
    });

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseModel = NearEarthObjectResponse.fromJson(
        jsonDecode(response.body),
      );
      var list = responseModel.asteroids
          .map((element) => element.toEntity())
          .toList();
      print(list);
      return list;
    } else {
      throw Exception('Error fetching asteroids');
    }
  }
}
