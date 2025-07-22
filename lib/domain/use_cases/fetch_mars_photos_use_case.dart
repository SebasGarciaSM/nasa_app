import 'package:nasa_app/domain/entities/mars_photo_entity.dart';
import 'package:nasa_app/domain/repositories/mars_repository.dart';

class FetchMarsPhotosUseCase {
  final MarsRepository repository;

  FetchMarsPhotosUseCase(this.repository);

  Future<List<MarsPhotoEntity>> call(String date) {
    return repository.fetchMarsPhotos(earthDate: date);
  }
}
