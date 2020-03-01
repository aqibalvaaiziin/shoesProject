import 'package:flutter/material.dart';

class TwoShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 130,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 83,
            left: 5,
            child: Container(
              width: 125,
              height: 35,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Colors.grey),
                ],
              ),
            ),
          ),
          Positioned(
            child: Image(
              width: 130,
              height: 130,
              image: AssetImage("assets/images/ozwmcn.png"),
            ),
          ),
          Positioned(
            top: 1,
            child: Image(
              width: 150,
              height: 150,
              image: AssetImage("assets/images/ozwmcn.png"),
            ),
          ),
        ],
      ),
    );
  }
}
