import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shoes/icons/icon.dart';

class CardProducts extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  bool isFav;
  CardProducts(this.image, this.name, this.price, this.isFav);
  @override
  Widget build(BuildContext context) {

    FlutterMoneyFormatter fmf2 = new FlutterMoneyFormatter(
      amount: price.toDouble(),
      settings: MoneyFormatterSettings(
          symbol: 'Rp.',
          thousandSeparator: '.',
          symbolAndNumberSeparator: ' ',
          compactFormatType: CompactFormatType.short),
    );
    
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.45,
          height: 300,
          color: Color(0xFFf4f6fb),
        ),
        Positioned(
          top: 0,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 200,
            color: Colors.grey[200],
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 163,
                  left: 25,
                  child: Container(
                    width: 135,
                    height: 6,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[500],
                            spreadRadius: 6,
                            blurRadius: 13)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 0,
                  left: 0,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(-15 / 360),
                    child: Image(
                      image: MemoryImage(base64Decode(image)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          left: 5,
          child: Container(
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: "D", fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 5,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Original",
                  style: TextStyle(
                      fontFamily: "FL", letterSpacing: 2, fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  fmf2.output.symbolOnLeft.toString(),
                  style: TextStyle(fontFamily: "F", fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 35,
            left: 140,
            child: !isFav ? CustomIcon.outlineHeart : CustomIcon.redHeart)
      ],
    );
  }
}
