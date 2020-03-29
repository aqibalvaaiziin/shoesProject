import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;

class EditProfileFactory {
  static Future<String> setRequest(
    int id,
    String nama,
    String email,
    String password,
    String alamat,
    String telp,
    File foto,
  ) async {
    try {
      var apiUrl = Uri.parse("https://sepatu.gopla.xyz/user/" + id.toString());
      final fileName = path.basename(foto.path);
      final bytes = await compute(compress, foto.readAsBytesSync());
      var requestData = http.MultipartRequest('PUT', apiUrl)
        ..fields['nama'] = nama
        ..fields['email'] = email
        ..fields['password'] = password
        ..fields['alamat'] = alamat
        ..fields['telp'] = telp
        ..files.add(
          new http.MultipartFile.fromBytes(
            'foto',
            bytes,
            filename: fileName,
          ),
        );
      await requestData.send();
      return "Data Berhasil di update";
    } catch (e) {
      return "Data Gagal di update";
    }
  }
}

List<int> compress(List<int> bytes) {
  var image = img.decodeImage(bytes);
  var resize = img.copyResize(image, width: 180, height: 180);
  return img.encodePng(resize);
}
