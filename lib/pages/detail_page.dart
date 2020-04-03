import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/widgets/cart_page/cart_button.dart';
import 'package:shoes/widgets/detail_page/size_shoes.dart';

import 'cart_page.dart';

class DetailPage extends StatefulWidget {
  final shoesImage;
  final shoesName;
  final shoesPrice;

  DetailPage({this.shoesImage, this.shoesName, this.shoesPrice});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var counter = 0;
  var total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          },
          child: CartButton()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0x34556fae).withAlpha(18),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(child: CustomIcon.back)),
                ),
                SizedBox(
                  height: 80,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * .82,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                    ),
                    Positioned(
                      top: 215.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height - 120.0,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 375,
                        height: 375,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      right: 50,
                      child: Container(
                        width: 270,
                        height: 18,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 15)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -90,
                      left: 20,
                      child: Center(
                        child: Hero(
                          tag: widget.shoesImage,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(-10 / 360),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(widget.shoesImage),
                                      fit: BoxFit.cover)),
                              height: 350.0,
                              width: 350.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 65,
                      right: 65,
                      top: 190,
                      child: Text(
                        widget.shoesName,
                        style: TextStyle(
                          fontFamily: "AD",
                          fontSize: 28,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      top: 228,
                      left: 50,
                      right: 50,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 1,
                        color: Colors.grey[200],
                      ),
                    ),
                    Positioned(
                      top: 250,
                      left: 22,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Deskripsi",
                              style: TextStyle(
                                  fontFamily: 'F', color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Lorem ipsum  Facilis, fugit ipsa! Omnis soluta consectetur placeat quod nisi, totam eaque aliquid magni fugiat earum dolorum quo?",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 350,
                      left: 20,
                      right: 20,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 1,
                        color: Colors.grey[200],
                      ),
                    ),
                    Positioned(
                      top: 370,
                      left: 22,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.625,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Tipe",
                              style: TextStyle(
                                  fontFamily: 'F', color: Colors.grey),
                            ),
                            Text(
                              "Ukuran",
                              style: TextStyle(
                                  fontFamily: 'F', color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 389,
                      left: 15,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 12, left: 10),
                              width: 145.0,
                              height: 40.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "OZWEEGO",
                                    style: TextStyle(fontFamily: "F", fontSize: 15,letterSpacing: 1.5),
                                  ),
                                  Text(
                                    "For Man",
                                    style: TextStyle(fontFamily: "FL", fontSize: 17,letterSpacing: 1),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 2,
                              height: 30,
                              color: Colors.grey,
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  SizeShoes("40", true),
                                  SizeShoes("43", false),
                                  SizeShoes("44", false),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 480,
                        left: 51,
                        right: 51,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[700]),
                          child: Center(
                            child: Text(
                              "Buy  Rp. " + widget.shoesPrice.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "CB",
                                fontSize: 17,
                                color: Colors.white,
                                letterSpacing: 1
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
