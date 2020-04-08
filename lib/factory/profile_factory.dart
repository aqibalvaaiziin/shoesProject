import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shoes/preference/user_preferences.dart';

class ProfileFactory {
  int id_user;
  String name;
  String email;
  String password;
  String alamat;
  String telp;
  String foto;

  ProfileFactory({
    this.id_user,
    this.name,
    this.email,
    this.password,
    this.alamat,
    this.telp,
    this.foto,
  });

  factory ProfileFactory.getResponse(Map<String, dynamic> object) {
    return ProfileFactory(
      id_user: object['id_user'],
      name: object['nama'],
      email: object['email'],
      password: object['password'],
      alamat: object['alamat'],
      telp: object['telp'],
      foto: object['foto'],
      
    );
  }

  static Future<ProfileFactory> setRequest() async {
    String apiURL = "https://sepatu.gopla.xyz/user/profile/me";
    UserPreferences _data = UserPreferences();
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    var apiResult = await http.get(
      apiURL,
      headers: {HttpHeaders.authorizationHeader: "$type $token"},
    );
    var jsonObject = json.decode(apiResult.body);
    var result = (jsonObject as Map<String, dynamic>)['data'];
    print(result);
    return ProfileFactory.getResponse(result);
  }
}
