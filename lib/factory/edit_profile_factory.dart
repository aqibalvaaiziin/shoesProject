import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfileFactory {
  EditProfileFactory();

  static Future<String> putData(
    int id,
    String name,
    String email,
    String password,
    String address,
    String telp,
    File foto,
  ) async {
    String message;
    String url = "https://sepatu.gopla.xyz/user/" + id.toString();
    final requestData = http.MultipartRequest('PUT', Uri.parse(url));
    final file = await http.MultipartFile.fromPath('foto', foto.path);
    requestData.fields['nama'] = name;
    requestData.fields['email'] = email;
    requestData.fields['password'] = password;
    requestData.fields['alamat'] = address;
    requestData.fields['telp'] = telp;
    requestData.files.add(file);

    try {
      final streamResponse = await requestData.send();
      final response = await http.Response.fromStream(streamResponse);
      if (response.statusCode != 200) return message = "gagal update";
      final Map<String, dynamic> responseData = json.decode(response.body);
      return message = "update berhasil";
    } catch (e) {
      print(e);
      return message = "gagal update";
    }
  }
}
