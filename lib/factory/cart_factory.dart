import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shoes/preference/user_preferences.dart';

class CartFactory {
  int idKeranjang;
  int idUser;
  int idSepatu;
  int jumlah;

  CartFactory({this.idKeranjang, this.idUser, this.idSepatu, this.jumlah});

  factory CartFactory.result(Map<String, dynamic> object) {
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
      dataCart.add(CartFactory.result(jsonObject[i]));
    }
    return dataCart;
  }
}
