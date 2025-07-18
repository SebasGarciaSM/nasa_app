import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AsteroidsViewModel extends ChangeNotifier {
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
}
