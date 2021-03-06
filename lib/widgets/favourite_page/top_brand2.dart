import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class TwoShoes2 extends StatelessWidget {
  String image;
  TwoShoes2(this.image);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 195,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 115,
            left: 25,
            child: Container(
              width: 140,
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
            child: Transform.rotate(
              angle: -math.pi / 14,
              child: Image(
                width: 160,
                height: 160,
                image: MemoryImage(base64Decode(image)),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            child: Transform.rotate(
              angle: -math.pi / 15,
              child: Image(
                width: 170,
                height: 170,
                image: MemoryImage(base64Decode(image)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
