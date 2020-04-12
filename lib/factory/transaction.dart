import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shoes/preference/user_preferences.dart';

class TransactionFactory {
  String idTransaksi;
  int idUser;
  String tanggal;
  int total;
  int idRetail;
  bool status;
  Map<String, dynamic> retail;

  TransactionFactory(
      {this.idTransaksi,
      this.idUser,
      this.tanggal,
      this.total,
      this.idRetail,
      this.status,
      this.retail});

  factory TransactionFactory.result(Map<String, dynamic> object) {
    return TransactionFactory(
      idTransaksi: object['id_transaksi'],
      idUser: object['id_user'],
    );
  }

  factory TransactionFactory.result2(Map<String, dynamic> object) {
    return TransactionFactory(
      idTransaksi: object['id_transaksi'],
      idUser: object['id_user'],
      tanggal: object['tanggal'],
      total: object['total'],
      idRetail: object['id_retail'],
      status: object['status'],
      retail: object['Retail'],
    );
  }

  static Future<TransactionFactory> postTransaction() async {
    UserPreferences _data = UserPreferences();
    String url = "https://sepatu.gopla.xyz/transaksi/";
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    var apiResult = await http.post(
      url,
      body: json.encode({}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "$type $token"
      },
    );
    var jsonObject = json.decode(apiResult.body);
    return TransactionFactory.result(jsonObject);
  }

  static Future<void> putTransaction(String idTransaksi, int idRetail) async {
    UserPreferences _data = UserPreferences();
    String url = "https://sepatu.gopla.xyz/transaksi/" + idTransaksi;
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    await http.put(
      url,
      body: json.encode({"id_retail": idRetail}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "$type $token"
      },
    );
  }

  static Future<List<TransactionFactory>> getData() async {
    UserPreferences _data = UserPreferences();
    String api = "https://sepatu.gopla.xyz/transaksi/";
    String token = await _data.getTokenCode();
    String type = await _data.getTokenType();
    var apiResult = await http
        .get(api, headers: {HttpHeaders.authorizationHeader: "$type $token"});
    var jsonObject = json.decode(apiResult.body);
    List<TransactionFactory> dataCart = [];
    for (var i = 0; i < jsonObject.length; i++) {
      dataCart.add(TransactionFactory.result2(jsonObject[i]));
    }
    return dataCart;
  }
}
