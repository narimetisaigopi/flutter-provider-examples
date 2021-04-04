import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  DateTime dateTime = DateTime.now();

  updateTimeDate() {
    dateTime = DateTime.now();
    notifyListeners();
  }
}
