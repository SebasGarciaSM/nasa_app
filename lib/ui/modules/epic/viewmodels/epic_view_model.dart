import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/core/state_status.dart';
import 'package:nasa_app/domain/entities/epic_entity.dart';
import 'package:nasa_app/domain/use_cases/fetch_epic_use_case.dart';

class EpicViewModel extends ChangeNotifier {
  final FetchEpicUseCase fetchEpicUseCase;

  EpicViewModel(this.fetchEpicUseCase);

  List<EpicEntity> epics = [];
  StateStatus status = StateStatus.initial;
  String? error;

  Future<void> loadEpics() async {
    status = StateStatus.loading;
    error = null;
    notifyListeners();

    try {
      epics = await fetchEpicUseCase();
      status = StateStatus.completed;
    } catch (e) {
      error = e.toString();
      status = StateStatus.error;
    }

    notifyListeners();
  }

  String formattedDateWithTimezone(DateTime date) {
    final localTime = date.toLocal();
    final offset = localTime.timeZoneOffset;
    final hours = offset.inHours.abs().toString().padLeft(2, '0');
    final minutes = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    final sign = offset.isNegative ? '-' : '+';

    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(localTime);
    return '$formattedDate UTC$sign$hours:$minutes';
  }
}
