import 'dart:io';

import 'package:http/http.dart' as http;

class EditProfileFactory {
  String message;

  EditProfileFactory({this.message});

  factory EditProfileFactory.getResult(String object) {
    return EditProfileFactory(message: object);
  }

  static Future<EditProfileFactory> setRequest(
    String id,
    String nama,
    String email,
    String password,
    String alamat,
    String telp,
    String foto,
  ) async {
    var apiUrl = Uri.parse("https://sepatu.gopla.xyz/user/" + id);
    var requestData = http.MultipartRequest('PUT', apiUrl)
      ..fields['nama'] = nama
      ..fields['email'] = email
      ..fields['password'] = password
      ..fields['alamat'] = alamat
      ..fields['telp'] = telp
      ..files.add(await http.MultipartFile.fromPath('foto', foto));

    var response = await requestData.send();
    if (response.statusCode == 200)
      return EditProfileFactory.getResult("data upadated");
  }
}
