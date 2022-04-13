// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class CustomThemeModel extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get getThemeData => _themeData;

  void setThemeData(ThemeData data) {
    _themeData = data;
    notifyListeners();
  }
}
