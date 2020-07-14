import 'package:shared_preferences/shared_preferences.dart';

class MotiSharedPreferences {
  static SharedPreferences _instance;

  static Future<SharedPreferences> _getInstance() async {
    if (_instance == null) {
      _instance = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  static Future<bool> getBool(String key) async =>
      (await _getInstance()).getBool(key);

  static setBool(String key, bool value) async =>
      (await _getInstance()).setBool(key, value);

  static Future<String> getString(String key) async =>
      (await _getInstance()).getString(key);

  static setString(String key, String value) async =>
      (await _getInstance()).setString(key, value);
}
