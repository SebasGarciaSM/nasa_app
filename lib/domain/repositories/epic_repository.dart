import 'package:nasa_app/domain/entities/epic_entity.dart';

abstract class EpicRepository {
  Future<List<EpicEntity>> fetchEpic();
}
