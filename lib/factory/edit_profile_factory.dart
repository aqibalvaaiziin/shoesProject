import 'dart:io';
import 'package:http/http.dart' as http;

class EditProfileFactory {
  EditProfileFactory();

  static Future<String> putData(
    int idUser,
    String name,
    String email,
    String password,
    String address,
    String telp,
    File foto,
  ) async {
    String url = "https://sepatu.gopla.xyz/user/" + idUser.toString();
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
      if (response.statusCode != 200) return "gagal update";
      return "update berhasil";
    } catch (e) {
      print(e);
      return "gagal update";
    }
  }
}
