import 'package:flutter/material.dart';
import 'package:shoes/pages/login_page.dart';
import 'package:shoes/widgets/register_page/clipper_reg.dart';

class RegisterPage extends StatelessWidget {
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
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
