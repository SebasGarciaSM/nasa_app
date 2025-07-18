import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/core/state_status.dart';
import 'package:nasa_app/domain/entities/asteroid_entity.dart';
import 'package:nasa_app/domain/use_cases/fetch_asteroids_use_case.dart';

class AsteroidsViewModel extends ChangeNotifier {
  final FetchAsteroidsUseCase _fetchAsteroidsUseCase;
  AsteroidsViewModel(this._fetchAsteroidsUseCase);

  StateStatus status = StateStatus.initial;
  String? error;

  List<AsteroidEntity>? _asteroids = [];
  List<AsteroidEntity>? get asteroids => _asteroids;

  DateTime? _startDate;
  DateTime? _endDate;

  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;

  String get formattedStart => _startDate != null ? _format(_startDate!) : '';
  String get formattedEnd => _endDate != null ? _format(_endDate!) : '';

  void setStartDate(DateTime date) {
    _startDate = date;
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    _endDate = date;
    notifyListeners();
  }

  String _format(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  Future<void> loadAsteroids() async {
    if (_startDate == null || _endDate == null) return;

    status = StateStatus.loading;
    error = null;
    notifyListeners();

    try {
      final result = await _fetchAsteroidsUseCase(
        startDate: formattedStart,
        endDate: formattedEnd,
      );
      _asteroids = result;
      status = StateStatus.completed;
    } catch (e) {
      status = StateStatus.error;
      error = e.toString();
    }
    notifyListeners();
  }
}
