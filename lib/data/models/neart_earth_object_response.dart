import 'package:nasa_app/data/models/asteroid_model.dart';

class NearEarthObjectResponse {
  final int elementCount;
  final List<AsteroidModel> asteroids;

  NearEarthObjectResponse({
    required this.elementCount,
    required this.asteroids,
  });

  factory NearEarthObjectResponse.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> neoMap = json['near_earth_objects'];
    final List<AsteroidModel> asteroidsList = [];

    for (final date in neoMap.keys) {
      final List<dynamic> dailyAsteroids = neoMap[date];
      for (final raw in dailyAsteroids) {
        asteroidsList.add(AsteroidModel.fromJson(raw));
      }
    }

    return NearEarthObjectResponse(
      elementCount: json['element_count'],
      asteroids: asteroidsList,
    );
  }
}
