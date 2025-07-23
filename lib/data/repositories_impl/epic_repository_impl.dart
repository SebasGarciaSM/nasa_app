// ignore_for_file: avoid_print
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa_app/core/network/http_validator.dart';
import 'package:nasa_app/data/models/epic_model.dart';
import 'package:nasa_app/domain/entities/epic_entity.dart';
import 'package:nasa_app/domain/repositories/epic_repository.dart';

class EpicRepositoryImpl implements EpicRepository {
  final apiKey = dotenv.env['API_KEY']!;

  @override
  Future<List<EpicEntity>> fetchEpic() async {
    try {
      final url = Uri.parse(
        'https://api.nasa.gov/EPIC/api/natural?api_key=$apiKey',
      );

      final response = await HttpValidator.get(url);
      final json = HttpValidator.validateResponse(response);
      final List<dynamic> data = List.of(json);
      return data.map((json) => EpicModel.fromJson(json)).toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
