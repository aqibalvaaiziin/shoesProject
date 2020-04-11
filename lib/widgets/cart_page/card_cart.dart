import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shoes/factory/cart_factory.dart';

class CartCard extends StatefulWidget {
  String nama, tipe, gambar;
  int idSepatu, harga, jumlah, ukuran;
  CartCard(this.idSepatu, this.nama, this.tipe, this.harga, this.jumlah,
      this.ukuran, this.gambar);
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int qty = 0;
  var result = List<CartFactory>();
 

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 191,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400],
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 7))
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 135,
            left: 35,
            child: Container(
              width: 140,
              height: 10,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                )
              ]),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.nama,
                  style: TextStyle(
                      fontFamily: "FL",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 170),
                  child: Transform(
                    transform: Matrix4.rotationY(math.pi),
                    child: Image(
                      width: 158,
                      image: MemoryImage(base64Decode(widget.gambar)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
