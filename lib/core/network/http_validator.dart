// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nasa_app/core/exceptions.dart';

class HttpValidator {
  static dynamic validateResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 401:
        throw UnauthorizedException(response.statusCode.toString());
      case 403:
        throw ForbiddenException(response.statusCode.toString());
      case 404:
        throw NotFoundException(response.statusCode.toString());
      default:
        throw AppException(response.statusCode.toString());
    }
  }

  static Future<http.Response> get(Uri url) async {
    try {
      final response = await http.get(url);
      return response;
    } on SocketException catch (e) {
      print(e.toString());
      throw NoInternetException(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
