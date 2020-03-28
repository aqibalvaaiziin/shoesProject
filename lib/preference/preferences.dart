import 'package:shared_preferences/shared_preferences.dart';

class PreferencesData {
  void setTokenCode(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("tokenCode", data);
  }

  Future<String> getTokenCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("tokenCode") ?? null;
  }

  void setTokenType(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("tokenType", data);
  }

  Future<String> getTokenType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("tokenType") ?? null;
  }
}
