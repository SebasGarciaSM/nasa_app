// ignore_for_file: avoid_print

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa_app/core/network/http_validator.dart';
import 'package:nasa_app/data/models/apod_model.dart';
import 'package:nasa_app/domain/entities/apod_entity.dart';
import 'package:nasa_app/domain/repositories/apod_repository.dart';

class ApodRepositoryImpl implements ApodRepository {
  final apiKey = dotenv.env['API_KEY']!;

  @override
  Future<ApodEntity> fetchApod() async {
    try {
      final url = Uri.parse(
        "https://api.nasa.gov/planetary/apod?api_key=$apiKey",
      );

      final response = await HttpValidator.get(url);
      final json = HttpValidator.validateResponse(response);
      final model = ApodModel.fromJson(json);
      return ApodEntity(
        title: model.title,
        explanation: model.explanation,
        imageUrl: model.url,
        date: model.date,
      );
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
