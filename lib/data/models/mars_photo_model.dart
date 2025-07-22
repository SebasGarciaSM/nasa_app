import 'package:nasa_app/domain/entities/mars_photo_entity.dart';

class MarsPhotoModel extends MarsPhotoEntity {
  MarsPhotoModel({
    required super.id,
    required super.imgSrc,
    required super.earthDate,
    required super.cameraName,
    required super.roverName,
  });

  factory MarsPhotoModel.fromJson(Map<String, dynamic> json) {
    return MarsPhotoModel(
      id: json['id'].toString(),
      imgSrc: json['img_src'],
      earthDate: json['earth_date'],
      cameraName: json['camera']['full_name'],
      roverName: json['rover']['name'],
    );
  }
}
