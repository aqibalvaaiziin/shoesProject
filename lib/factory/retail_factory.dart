import 'dart:convert';

import 'package:http/http.dart' as http;

class RetailFactory {
  String id;
  String nama;
  String lokasi;
  String telp;

  RetailFactory({this.id, this.nama, this.lokasi, this.telp});

  factory RetailFactory.createReseultObject(Map<String, dynamic> object) {
    return RetailFactory(
      id: object['id_retail'].toString(),
      nama: object['nama'],
      lokasi: object['lokasi'],
      telp: object['telp'],
    );
  }

  static Future<List<RetailFactory>> getRetail() async{
    String apiUrl = "https://sepatu.gopla.xyz/retail";
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    List<RetailFactory> listRetail = [];
    for (var i = 0; i < jsonObject.length; i++) {
      listRetail.add(RetailFactory.createReseultObject(jsonObject[i]));
    } 
    return listRetail;
  }

}
