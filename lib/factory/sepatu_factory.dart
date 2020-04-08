import 'dart:convert';

import 'package:http/http.dart' as http;

class SepatuFactory {
  int id;
  String nama;
  String tipe;
  int ukuran;
  String desc;
  String gender;
  int harga;
  int stock;
  String gambar;

  SepatuFactory(
      {this.id,
      this.nama,
      this.tipe,
      this.ukuran,
      this.desc,
      this.gender,
      this.harga,
      this.stock,
      this.gambar});

  factory SepatuFactory.result(Map<String, dynamic> object) {
    return SepatuFactory(
      id: object['id_sepatu'],
      nama: object['nama'],
      tipe: object['tipe'],
      ukuran: object['ukuran'],
      desc: object['deskripsi'],
      gender: object['gender'],
      harga: object['harga'],
      stock: object['stok'],
      gambar: object['gambar'],
    );
  }

  static Future<List<SepatuFactory>> byType(String type) async {
    String url = "https://sepatu.gopla.xyz/sepatu/group/type/" + type;
    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);
    List<SepatuFactory> dataShoes = [];
    for (var i = 0; i < jsonObject.length; i++) {
      dataShoes.add(SepatuFactory.result(jsonObject[i]));
    }
    return dataShoes;
  }

  static Future<List<SepatuFactory>> bestSeller() async {
    String url = "https://sepatu.gopla.xyz/sepatu/group/bestseller";
    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);
    List<SepatuFactory> dataShoes = [];
    for (var i = 0; i < jsonObject.length; i++) {
      dataShoes.add(SepatuFactory.result(jsonObject[i]));
    }
    return dataShoes;
  }

  static Future<List<SepatuFactory>> byName(String name) async {
    String url = "https://sepatu.gopla.xyz/sepatu/group/name/" + name;
    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);
    List<SepatuFactory> dataShoes = [];
    for (var i = 0; i < jsonObject.length; i++) {
      dataShoes.add(SepatuFactory.result(jsonObject[i]));
    }
    return dataShoes;
  }
}
