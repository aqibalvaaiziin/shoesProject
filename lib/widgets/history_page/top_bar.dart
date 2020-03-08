import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xaba9a4a),
          Color(0x75757332),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            left: 20,
            child: Image(
              width: 80,
              height: 80,
              image: AssetImage("assets/images/user.png"),
            ),
          ),
          Positioned(
            top: 85,
            left: 110,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.58,
              height: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Nama User",
                    style: TextStyle(fontSize: 17, fontFamily: "F"),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "keranjang.length\nkeranjang\nsaya",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "D",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "history.length\nbarang yang \ntelah saya dibeli",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "D",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
