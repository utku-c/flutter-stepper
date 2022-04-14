// ignore_for_file: unused_field, prefer_conditional_assignment, unnecessary_null_comparison

import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  late SharedPreferences preferences;

  static late SharedManager _instance;

  SharedManager._init();

  static SharedManager get instance {
    if (_instance == null) {
      _instance = SharedManager._init();
    }
    return _instance;
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveStringValue(SharedKey key, String value) async {
    return await preferences.setString(key.toString(), value);
  }

  String? getStringValue(SharedKey key) =>
      preferences.getString(key.toString());
}

enum SharedKey { veli, utku }
