import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/domain/entities/apod_entity.dart';
import 'package:nasa_app/domain/use_cases/fetch_apod_use_case.dart';

enum ApodStateStatus { initial, loading, completed, error }

class ApodViewModel extends ChangeNotifier {
  final FetchApodUseCase fetchApodUseCase;

  ApodViewModel(this.fetchApodUseCase);

  ApodEntity? apod;
  ApodStateStatus status = ApodStateStatus.initial;
  String? error;

  Future<void> loadApod() async {
    status = ApodStateStatus.loading;
    error = null;
    notifyListeners();

    try {
      apod = await fetchApodUseCase();
      status = ApodStateStatus.completed;
    } catch (e) {
      status = ApodStateStatus.error;
      error = e.toString();
    }
    notifyListeners();
  }
}
