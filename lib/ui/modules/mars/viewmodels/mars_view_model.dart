import 'package:flutter/material.dart';
import 'package:nasa_app/core/state_status.dart';
import 'package:nasa_app/domain/entities/mars_photo_entity.dart';
import 'package:nasa_app/domain/use_cases/fetch_mars_photos_use_case.dart';

class MarsViewModel extends ChangeNotifier {
  final FetchMarsPhotosUseCase fetchMarsPhotosUseCase;

  MarsViewModel(this.fetchMarsPhotosUseCase);

  List<MarsPhotoEntity> marsPhotos = [];
  StateStatus status = StateStatus.initial;
  String? error;

  String formattedDate = '';

  Future<void> loadMarsPhotos(String date) async {
    formattedDate = date;
    status = StateStatus.loading;
    error = null;
    notifyListeners();

    try {
      marsPhotos = await fetchMarsPhotosUseCase(date);
      status = StateStatus.completed;
    } catch (e) {
      error = e.toString();
      status = StateStatus.error;
    }

    notifyListeners();
  }
}
