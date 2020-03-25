import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginFactory {
  String tokenType;
  String exp;
  String token;

  LoginFactory({this.tokenType, this.exp, this.token});

  factory LoginFactory.createPostResult(Map<String, dynamic> object) {
    return LoginFactory(
      tokenType: object['tokenType'],
      exp: object['expiresIn'],
      token: object['token'],
    );
  }

  static Future<LoginFactory> createPostBody(String email, String password) async {
    String apiURL = "https://sepatu.gopla.xyz/user/login";
    var apiResult = await http.post(apiURL, body: {"email": email, "password": password});
    var jsonObject = json.decode(apiResult.body);
    return LoginFactory.createPostResult(jsonObject);
  }
}
