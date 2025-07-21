import 'package:nasa_app/domain/entities/epic_entity.dart';

class EpicModel extends EpicEntity {
  EpicModel({
    required super.identifier,
    required super.caption,
    required super.image,
    required super.date,
    required super.latitude,
    required super.longitude,
  });

  factory EpicModel.fromJson(Map<String, dynamic> json) {
    return EpicModel(
      identifier: json['identifier'],
      caption: json['caption'],
      image: json['image'],
      date: DateTime.parse(json['date']),
      latitude: (json['centroid_coordinates']['lat'] as num).toDouble(),
      longitude: (json['centroid_coordinates']['lon'] as num).toDouble(),
    );
  }
}
