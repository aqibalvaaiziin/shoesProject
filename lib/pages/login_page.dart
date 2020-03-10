import 'package:flutter/material.dart';
import 'package:shoes/main.dart';
import 'package:shoes/widgets/login_page/clipperLogin.dart';

class LoginPage extends StatelessWidget {
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
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: "Nama : ",
                          labelStyle: TextStyle(color: Colors.grey)),
                    ),
                    TextField(
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
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
                    RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Belum memiliki akun ? ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "D")),
                          TextSpan(
                              text: "Daftar",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  fontFamily: "D"))
                        ],
                      ),
                    ),
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
