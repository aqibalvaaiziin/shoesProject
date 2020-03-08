import 'package:flutter/material.dart';
import 'package:shoes/pages/main_page.dart';

class HomePage extends StatelessWidget {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
            child: Image(
              image: AssetImage("assets/images/hongkong.jpg"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
            child: Image(
              image: AssetImage("assets/images/super.jpg"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
            child: Image(
              image: AssetImage("assets/images/predator.jpg"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
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
