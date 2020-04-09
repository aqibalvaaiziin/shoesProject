import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoes/factory/cart_factory.dart';
import 'package:shoes/factory/sepatu_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/cart_page.dart';

class DetailPage extends StatefulWidget {
  final String nama;
  DetailPage({this.nama});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var result = List<SepatuFactory>();
  var selectedIndex;
  int dataIdSepatu = 0;
  CartFactory dataCart;

  void dataSepatu() {
    SepatuFactory.byName(widget.nama).then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
        });
      }
    });
  }

  @override
  void initState() {
    dataSepatu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          CartFactory.postData(dataIdSepatu, 1).then((value) {
            dataCart = value;
          });
          print(dataIdSepatu);
          print(dataCart.idSepatu);
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 5))
              ]),
          child: Stack(
            children: <Widget>[
              Positioned(
                  right: 5,
                  bottom: 15,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 15,
                  )),
              Center(child: CustomIcon.cart),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[300],
          ),
          Positioned(
            top: 450,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 40,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                result[0].nama,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "F",
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Harga",
                  style: TextStyle(
                      fontSize: 22, fontFamily: "FL", letterSpacing: 1),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  result[0].harga.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "AD",
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 500,
            left: 90,
            child: Container(
              width: 250,
              height: 20,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black, blurRadius: 30, spreadRadius: 3)
              ]),
            ),
          ),
          Positioned(
            top: 270,
            left: 20,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(-15 / 360),
              child: Image(
                image: MemoryImage(base64Decode(result[0].gambar)),
                width: 350,
                height: 350,
              ),
            ),
          ),
          Positioned(
            top: 570,
            left: 40,
            right: 40,
            child: Container(
              width: 350,
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    result[0].nama,
                    style: TextStyle(
                        fontSize: 25, fontFamily: "F", letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    result[0].desc,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Details",
                    style: TextStyle(
                        fontSize: 25, fontFamily: "F", letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Type      : " + result[0].tipe,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Gender  : " + result[0].gender,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 40,
            child: Text(
              "Ukuran",
              style:
                  TextStyle(fontSize: 22, fontFamily: "FL", letterSpacing: 1),
            ),
          ),
          Positioned(
            top: 320,
            left: 40,
            child: Container(
              width: 150,
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              dataIdSepatu = result[index].idSepatu;
                            });
                          },
                          child: sizeShoes(
                              result[index].ukuran, selectedIndex == index)),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(40, 45),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 20,
                      height: 40,
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CartPage()));
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: <Widget>[
                          Center(child: CustomIcon.cartAll),
                          Transform.translate(
                            offset: Offset(35, 3),
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Center(
                                child: Text(
                                  "8",
                                  style:
                                      TextStyle(fontSize: 10, fontFamily: "F"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget sizeShoes(int size, bool selected) {
  return Container(
    width: 35,
    height: 35,
    decoration: BoxDecoration(
      color: selected == true ? Colors.black : Colors.white,
      borderRadius: BorderRadius.circular(3),
    ),
    child: Center(
        child: Text(
      size.toString(),
      style: TextStyle(
          fontFamily: "D",
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 1,
          color: selected == true ? Colors.white : Colors.black),
    )),
  );
}
