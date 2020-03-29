import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
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

  void setIdUser(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("idUser", data);
  }

  Future<String> getIdUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("idUser") ?? null;
  }

  void setName(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("nameUser", data);
  }

  Future<String> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("nameUser") ?? null;
  }

  void setEmail(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("emailUser", data);
  }

  Future<String> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("emailUser") ?? null;
  }

  void setPassword(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("passUser", data);
  }

  Future<String> getPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("passUser") ?? null;
  }

  void setAlamat(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("alamatUser", data);
  }

  Future<String> getAlamat() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("alamatUser") ?? null;
  }

  void setTelp(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("telpUser", data);
  }

  Future<String> getTelp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("telpUser") ?? null;
  }

  void setFoto(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("fotoUser", data);
  }

  Future<String> getFoto() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("fotoUser") ?? null;
  }
}
