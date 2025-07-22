import 'package:nasa_app/domain/entities/mars_photo_entity.dart';

abstract class MarsRepository {
  Future<List<MarsPhotoEntity>> fetchMarsPhotos({required String earthDate});
}
