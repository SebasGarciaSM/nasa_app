import 'package:nasa_app/domain/entities/apod_entity.dart';

abstract class ApodRepository {
  Future<ApodEntity> fetchApod();
}
