import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa_app/data/models/epic_model.dart';
import 'package:nasa_app/domain/entities/epic_entity.dart';
import 'package:nasa_app/domain/repositories/epic_repository.dart';
import 'package:http/http.dart' as http;

class EpicRepositoryImpl implements EpicRepository {
  final apiKey = dotenv.env['API_KEY']!;

  @override
  Future<List<EpicEntity>> fetchEpic() async {
    final url = Uri.parse(
      'https://api.nasa.gov/EPIC/api/natural?api_key=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => EpicModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load EPIC data');
    }
  }
}
