import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shoes/preference/user_preferences.dart';

class CartFactory {
  int idKeranjang;
  int idUser;
  int idSepatu;
  int jumlah;
  Map<String, dynamic> sepatu;

  CartFactory(
      {this.idKeranjang, this.idUser, this.idSepatu, this.jumlah, this.sepatu});

  factory CartFactory.resultGet(Map<String, dynamic> object) {
    return CartFactory(
      idKeranjang: object['id_keranjang'],
      idUser: object['id_user'],
      idSepatu: object['id_sepatu'],
      jumlah: object['jumlah'],
      sepatu: object['Sepatu'],
    );
  }

  factory CartFactory.resultPost(Map<String, dynamic> object) {
    return CartFactory(
      idKeranjang: object['id_keranjang'],
      idUser: object['id_user'],
      idSepatu: object['id_sepatu'],
      jumlah: object['jumlah'],
    );
  }

  static Future<List<CartFactory>> getData() async {
    UserPreferences _data = UserPreferences();
    String api = "https://sepatu.gopla.xyz/keranjang/";
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    var apiResult = await http
        .get(api, headers: {HttpHeaders.authorizationHeader: "$type $token"});
    var jsonObject = json.decode(apiResult.body);
    List<CartFactory> dataCart = [];
    for (var i = 0; i < jsonObject.length; i++) {
      dataCart.add(CartFactory.resultGet(jsonObject[i]));
    }
    return dataCart;
  }

  static Future<void> delData(int idSepatu) async {
    UserPreferences _data = UserPreferences();
    String api = "https://sepatu.gopla.xyz/keranjang/" + idSepatu.toString();
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    await http.delete(api,
        headers: {HttpHeaders.authorizationHeader: "$type $token"});
  }

  static Future<CartFactory> postData(int idSepatu, int jumlah) async {
    UserPreferences _data = UserPreferences();
    String api = "https://sepatu.gopla.xyz/keranjang/";
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    var apiResult = await http.post(
      api,
      body: json.encode({"id_sepatu": idSepatu, "jumlah": jumlah}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "$type $token"
      },
    );
    var jsonObject = json.decode(apiResult.body);
    return CartFactory.resultPost(jsonObject);
  }

  static Future<void> putData(int idSepatu, int jumlah) async {
    UserPreferences _data = UserPreferences();
    String api = "https://sepatu.gopla.xyz/keranjang/";
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    await http.put(
      api,
      body: json.encode({"id_sepatu": idSepatu, "jumlah": jumlah}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "$type $token"
      },
    );
  }

  static Future<CartFactory> checkOut(int idSepatu, int jumlah) async {
    UserPreferences _data = UserPreferences();
    String api = "https://sepatu.gopla.xyz/transaksi/";
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    var apiResult = await http.post(
      api,
      body: json.encode({"id_sepatu": idSepatu, "jumlah": jumlah}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "$type $token"
      },
    );
    var jsonObject = json.decode(apiResult.body);
    return CartFactory.resultPost(jsonObject);
  }
}
