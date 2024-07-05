import 'package:shared_preferences/shared_preferences.dart';

class PreferenceServices {
  Future<SharedPreferences> prefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> setPref(key, value) async {
    try {
      var pref = await prefs();
      pref.setString(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getPref(key) async {
    try {
      var pref = await prefs();
      return await pref.getString(key);
    } catch (e) {
      return null;
    }
  }

  Future<bool> removePref(key) async {
    try {
      var pref = await prefs();
      pref.remove(key);
      return true;
    } catch (e) {
      return false;
    }
  }
}
