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

  static String dataToken = "";
  static String dataTokenType = "";

  static void data() {
    PreferencesData _data = PreferencesData();
    _data.getTokenCode().then((value) {
      dataToken = value;
    });

    _data.getTokenType().then((value) {
      dataTokenType = value;
    });
  }

  static Future<ProfileFactory> setRequest() async {
    data();
    String apiURL = "https://sepatu.gopla.xyz/user/profile/me";
    var apiResult = await http.get(
      apiURL,
      headers: {HttpHeaders.authorizationHeader: "$dataTokenType $dataToken"},
    );
    var jsonObject = json.decode(apiResult.body);
    print(jsonObject);
    return ProfileFactory.getResponse(jsonObject);
  }
}
