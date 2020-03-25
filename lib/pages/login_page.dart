import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes/factory/login_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/main.dart';
import 'package:shoes/pages/register_page.dart';
import 'package:shoes/widgets/login_page/clipperLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginFactory loginFactory = null;

  void setTokenCode(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("tokenCode", data);
  }

  Future<String> getTokenCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("tokenCode") ?? null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: ClipperBackground(),
              child: Container(
                width: double.infinity,
                height: 565,
                child: Image.asset(
                  "assets/images/bglogin.jpg",
                  fit: BoxFit.cover,
                  width: 500,
                  height: 570,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(100, -80),
              child: Text(
                "Login",
                style: TextStyle(
                  fontFamily: "F",
                  fontSize: 30,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -60),
              child: Container(
                height: 250,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: "Email : ",
                          labelStyle: TextStyle(color: Colors.grey)),
                    ),
                    TextField(
                      controller: password,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: "Password : ",
                          labelStyle: TextStyle(color: Colors.grey)),
                    ),
                    GestureDetector(
                      onTap: () {
                        LoginFactory.createPostBody(email.text, password.text)
                            .then((value) {
                          loginFactory = value;
                          if (loginFactory.tokenType == "bearer") {
                            setTokenCode(loginFactory.token);
                            Alert(
                                content: CustomIcon.check,
                                context: context,
                                style: AlertStyle(
                                    backgroundColor: Colors.grey[200],
                                    animationDuration:
                                        Duration(milliseconds: 600),
                                    animationType: AnimationType.grow,
                                    titleStyle: TextStyle(
                                      fontSize: 23,
                                      fontFamily: "D",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    isCloseButton: false,
                                    overlayColor: Colors.black87),
                                title: "Login Berhasil",
                                buttons: [
                                  DialogButton(
                                      width: 150,
                                      color: Color(0xaa18c5f5),
                                      child: Text(
                                        "Mulai Belanja ?",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: "D",
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MyApp()));
                                      }),
                                ]).show();
                          } else {
                            Alert(
                              context: context,
                              content: CustomIcon.remove,
                              style: AlertStyle(
                                  backgroundColor: Colors.grey[200],
                                  animationDuration:
                                      Duration(milliseconds: 600),
                                  animationType: AnimationType.grow,
                                  titleStyle: TextStyle(
                                    fontSize: 23,
                                    fontFamily: "FL",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  isCloseButton: false,
                                  overlayColor: Colors.black87),
                              title: "Email atau password anda salah",
                            ).show();
                          }
                        });

                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.blue[200],
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "F",
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Belum memiliki akun ?",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: "D"),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("lalala");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Container(
                              child: Text(
                                "Daftar ?",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueAccent,
                                    fontFamily: "D"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
