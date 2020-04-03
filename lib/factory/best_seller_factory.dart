import 'dart:convert';

import 'package:http/http.dart' as http;

class BestSellerFactory {
  int id;
  String nama;
  String tipe;
  int ukuran;
  String desc;
  String gender;
  int harga;
  int stock;
  String gambar;

  BestSellerFactory(
      {this.id,
      this.nama,
      this.tipe,
      this.ukuran,
      this.desc,
      this.gender,
      this.harga,
      this.stock,
      this.gambar});

  factory BestSellerFactory.result(Map<String, dynamic> object) {
    return BestSellerFactory(
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

  static Future<List<BestSellerFactory>> setResponse() async {
    String url = "https://sepatu.gopla.xyz/sepatu/group/bestseller";
    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);
    List<BestSellerFactory> dataShoes = [];
    for (var i = 0; i < jsonObject.length; i++) {
      dataShoes.add(BestSellerFactory.result(jsonObject[i]));
    }
    return dataShoes;
  }
}
