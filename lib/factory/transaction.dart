import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoes/preference/user_preferences.dart';

class TransactionFactory {
  String idTransaksi;
  int idUser;

  TransactionFactory({this.idTransaksi, this.idUser});

  factory TransactionFactory.result(Map<String, dynamic> object) {
    return TransactionFactory(
      idTransaksi: object['id_transaksi'],
      idUser: object['id_user'],
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

  static Future<void> putTransaction(
      String idTransaksi, int idRetail) async {
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
}
