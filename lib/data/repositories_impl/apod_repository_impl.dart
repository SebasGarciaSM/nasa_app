import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa_app/data/models/apod_model.dart';
import 'package:nasa_app/domain/entities/apod_entity.dart';
import 'package:nasa_app/domain/repositories/apod_repository.dart';
import 'package:http/http.dart' as http;

class ApodRepositoryImpl implements ApodRepository {
  final apiKey = dotenv.env['API_KEY']!;

  @override
  Future<ApodEntity> fetchApod() async {
    final url = Uri.parse(
      "https://api.nasa.gov/planetary/apod?api_key=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final model = ApodModel.fromJson(json);
      return ApodEntity(
        title: model.title,
        explanation: model.explanation,
        imageUrl: model.url,
        date: model.date,
      );
    } else {
      throw Exception('Failed to load APOD');
    }
  }
}
