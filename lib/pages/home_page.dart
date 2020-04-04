import 'package:flutter/material.dart';
import 'package:shoes/pages/main_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                type = "USBR Hongkong";
              });
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(shoesType: type),
                ),
              );
            },
            child: Image(
              image: AssetImage("assets/images/hongkong.jpg"),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                type = "superstar";
              });
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(shoesType: type),
                ),
              );
            },
            child: Image(
              image: AssetImage("assets/images/super.jpg"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                type = "ozw";
              });
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(shoesType: type),
                ),
              );
            },
            child: Image(
              image: AssetImage("assets/images/ozweego.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
