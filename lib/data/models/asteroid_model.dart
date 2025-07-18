import 'package:nasa_app/domain/entities/asteroid_entity.dart';

class AsteroidModel {
  final String id;
  final String name;
  final double magnitude;
  final bool isHazardous;
  final String approachDate;
  final String velocityKph;
  final String missDistanceKm;

  AsteroidModel({
    required this.id,
    required this.name,
    required this.magnitude,
    required this.isHazardous,
    required this.approachDate,
    required this.velocityKph,
    required this.missDistanceKm,
  });

  factory AsteroidModel.fromJson(Map<String, dynamic> json) {
    final approach = json['close_approach_data'][0];

    return AsteroidModel(
      id: json['id'],
      name: json['name'],
      magnitude: (json['absolute_magnitude_h'] as num).toDouble(),
      isHazardous: json['is_potentially_hazardous_asteroid'],
      approachDate: approach['close_approach_date'],
      velocityKph: approach['relative_velocity']['kilometers_per_hour'],
      missDistanceKm: approach['miss_distance']['kilometers'],
    );
  }

  AsteroidEntity toEntity() => AsteroidEntity(
    id: id,
    name: name,
    magnitude: magnitude,
    isHazardous: isHazardous,
    approachDate: approachDate,
    velocityKph: velocityKph,
    missDistanceKm: missDistanceKm,
  );
}
