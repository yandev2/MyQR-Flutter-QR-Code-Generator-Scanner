import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  Future<bool> addString(String value, String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  Future<bool> remove(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }
}
