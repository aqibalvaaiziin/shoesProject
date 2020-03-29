import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shoes/preference/preferences.dart';

class ProfileFactory {
  String id;
  String name;
  String email;
  String alamat;
  String telp;
  String foto;

  ProfileFactory({
    this.id,
    this.name,
    this.email,
    this.alamat,
    this.telp,
    this.foto,
  });

  factory ProfileFactory.getResponse(Map<String, dynamic> object) {
    return ProfileFactory(
      id: object['id_user'].toString(),
      name: object['nama'],
      email: object['email'],
      alamat: object['alamat'],
      telp: object['telp'],
      foto: object['foto'],
    );
  }

  static Future<ProfileFactory> setRequest() async {
    String apiURL = "https://sepatu.gopla.xyz/user/profile/me";
    PreferencesData _data = PreferencesData();
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    var apiResult = await http.get(
      apiURL,
      headers: {HttpHeaders.authorizationHeader: "$type $token"},
    );
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    // print(data);
    return ProfileFactory.getResponse(data);
  }

}
