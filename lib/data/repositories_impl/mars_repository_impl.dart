import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa_app/data/models/mars_photo_model.dart';
import 'package:nasa_app/domain/entities/mars_photo_entity.dart';
import 'package:nasa_app/domain/repositories/mars_repository.dart';
import 'package:http/http.dart' as http;

class MarsRepositoryImpl implements MarsRepository {
  final apiKey = dotenv.env['API_KEY']!;

  @override
  Future<List<MarsPhotoEntity>> fetchMarsPhotos({
    required String earthDate,
  }) async {
    final url = Uri.parse(
      'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=$earthDate&api_key=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['photos'];
      return data.map((json) => MarsPhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Mars Rover photos');
    }
  }
}
