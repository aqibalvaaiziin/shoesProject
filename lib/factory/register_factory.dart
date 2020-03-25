import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterFactory {
  int id;
  String nama;
  String email;
  String password;
  String alamat;
  String telp;
  String foto;

  RegisterFactory(
      {this.id,
      this.nama,
      this.email,
      this.password,
      this.alamat,
      this.telp,
      this.foto});

  factory RegisterFactory.createPostResult(Map<String, dynamic> object) {
    return RegisterFactory(
      id: object['id_user'],
      nama: object['nama'],
      email: object['email'],
      password: object['password'],
      alamat: object['alamat'],
      telp: object['telp'],
      foto: object['foto'],
    );
  }

  static Future<RegisterFactory> createPostBody(String nama, String email,
      String password, String alamat, String telp) async {
    String apiUrl = "https://sepatu.gopla.xyz/user/";
    var apiResult = await http.post(apiUrl, body: {
      "nama": nama,
      "email": email,
      "password": password,
      "alamat": alamat,
      "telp": telp,
      "foto": "null"
    });
    var jsonObject = json.decode(apiResult.body);

    return RegisterFactory.createPostResult(jsonObject);
  }
}
