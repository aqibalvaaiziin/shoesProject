import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/cart_page.dart';

class TopHeader extends StatefulWidget {
  @override
  _TopHeaderState createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.943,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue[200], Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Transform.translate(
          offset: Offset(0, 90),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
                child: Column(
              children: <Widget>[
                Text(
                  "Moch Aqib Alvaaiziin",
                  style: TextStyle(
                      fontFamily: "F", fontSize: 23, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Jl.Ikan Gurami No 14",
                  style: TextStyle(
                      fontFamily: "D",
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
          ),
        ),
        Transform.translate(
          offset: Offset(0, 250),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(color: Colors.white),
          ),
        ),
        Transform.translate(
          offset: Offset(30, 180),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.16,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(0, 3))
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "History Belanja",
                    style: TextStyle(
                      fontFamily: "D",
                      letterSpacing: 2,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Rp. 10.530.000",
                    style: TextStyle(
                        fontFamily: "F",
                        fontSize: 26,
                        letterSpacing: 1,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Dari 17-12-2020 sampai --",
                    style: TextStyle(
                        fontFamily: "M",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(30, 345),
          child: Text(
            "History Belanja",
            style: TextStyle(fontFamily: "F"),
          ),
        ),
        Transform.translate(
            offset: Offset(340, 45),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              child: Column(
                children: <Widget>[
                  CustomIcon.bagW,
                  Transform.translate(
                    offset: Offset(15, -25),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            fontFamily: "F",
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
