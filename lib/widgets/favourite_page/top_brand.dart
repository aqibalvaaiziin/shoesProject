import 'package:flutter/material.dart';
import 'dart:math' as math;

class TwoShoes extends StatelessWidget {
  String image;
  TwoShoes(this.image);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 195,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 115,
            left: 5,
            child: Container(
              width: 150,
              height: 45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Color(0xb1858381).withOpacity(0.5)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Transform.rotate(
                angle: -math.pi / 14,
                child: Image(
                  width: 160,
                  height: 160,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Transform.rotate(
                angle: -math.pi / 15,
                child: Image(
                  width: 170,
                  height: 170,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
