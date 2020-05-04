import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shoes/factory/register_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/login_page.dart';
import 'package:shoes/widgets/register_page/clipper_reg.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController telp = TextEditingController();
  RegisterFactory registerFactory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: ClipperRegister(),
              child: Container(
                width: double.infinity,
                height: 505,
                child: Image.asset(
                  "assets/images/bgreg.jpg",
                  fit: BoxFit.cover,
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-115, -65),
              child: Text(
                "Register",
                style: TextStyle(
                  fontFamily: "F",
                  fontSize: 30,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -50),
              child: Container(
                height: 420,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: name,
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
                      controller: email,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
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
                    TextField(
                      controller: alamat,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: "Alamat : ",
                          labelStyle: TextStyle(color: Colors.grey)),
                    ),
                    TextField(
                      controller: telp,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: "No Telephone : ",
                          labelStyle: TextStyle(color: Colors.grey)),
                    ),
                    GestureDetector(
                      onTap: () {
                        RegisterFactory.createPostBody(name.text, email.text,
                                password.text, alamat.text, telp.text)
                            .then((value) {
                          registerFactory = value;
                          bool condition = (name.text != "" &&
                              email.text != "" &&
                              password.text != "" &&
                              alamat.text != "" &&
                              telp.text != "");
                          if (condition) {
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
                                title: "Register Berhasil Berhasil",
                                buttons: [
                                  DialogButton(
                                      width: 190,
                                      color: Color(0xaa18c5f5),
                                      child: Center(
                                        child: Text(
                                          "Kembali ke halaman login ?",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "D",
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
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
                              title: "Lengkapi data dengan benar !!",
                            ).show();
                          }
                        });
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
                            "Daftar",
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
                      padding: EdgeInsets.fromLTRB(75, 0, 70, 0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Sudah memiliki akun ?",
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
                              Navigator.of(context, rootNavigator: true)
                                  .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                      (Route<dynamic> route) => false);
                            },
                            child: Container(
                              child: Text(
                                "Kembali Login ?",
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
