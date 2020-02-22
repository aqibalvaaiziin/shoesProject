import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Image(
              image: AssetImage("assets/images/hongkong.jpg"),
            ),
          ),
          Center(
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width - 50,
              color: Colors.grey[300],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image(
              image: AssetImage("assets/images/super.jpg"),
            ),
          ),
          Center(
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width - 50,
              color: Colors.grey[300],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image(
              image: AssetImage("assets/images/predator.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
