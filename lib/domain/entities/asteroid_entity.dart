class AsteroidEntity {
  final String id;
  final String name;
  final double magnitude;
  final bool isHazardous;
  final String approachDate;
  final String velocityKph;
  final String missDistanceKm;

  AsteroidEntity({
    required this.id,
    required this.name,
    required this.magnitude,
    required this.isHazardous,
    required this.approachDate,
    required this.velocityKph,
    required this.missDistanceKm,
  });
}
