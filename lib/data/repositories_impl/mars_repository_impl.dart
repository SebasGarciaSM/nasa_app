// ignore_for_file: avoid_print

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa_app/core/network/http_validator.dart';
import 'package:nasa_app/data/models/mars_photo_model.dart';
import 'package:nasa_app/domain/entities/mars_photo_entity.dart';
import 'package:nasa_app/domain/repositories/mars_repository.dart';

class MarsRepositoryImpl implements MarsRepository {
  final apiKey = dotenv.env['API_KEY']!;

  @override
  Future<List<MarsPhotoEntity>> fetchMarsPhotos({
    required String earthDate,
  }) async {
    try {
      final url = Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=$earthDate&api_key=$apiKey',
      );

      final response = await HttpValidator.get(url);
      final json = HttpValidator.validateResponse(response);
      final List<dynamic> data = json['photos'];
      return data.map((json) => MarsPhotoModel.fromJson(json)).toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
