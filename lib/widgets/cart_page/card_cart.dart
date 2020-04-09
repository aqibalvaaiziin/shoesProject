import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  String nama, tipe, gambar;
  int harga, jumlah, ukuran;
  CartCard(
      this.nama, this.tipe, this.harga, this.jumlah, this.ukuran, this.gambar);
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int qty = 0;

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
            Positioned(
              top: 50,
              right: 15,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      widget.tipe,
                      style: TextStyle(fontFamily: "D", fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Size " +widget.ukuran.toString(),
                      style: TextStyle(fontFamily: "D", fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rp. " + widget.harga.toString(),
                      style: TextStyle(
                          fontFamily: "D",
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (widget.jumlah > 1) {
                                    widget.jumlah -= 1;
                                  }
                                });
                              },
                              splashColor: Colors.grey,
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontFamily: "F",
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            widget.jumlah.toString(),
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: "F",
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  widget.jumlah += 1;
                                });
                              },
                              splashColor: Colors.grey,
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "F",
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
