import 'package:flutter/material.dart';
import 'package:shoes/widgets/cart_page/card_cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var lala = [
    {
      "image": "assets/images/ozwb.png",
      "name": "Adidas Blue Accent",
      "price": 300000
    },
    {
      "image": "assets/images/ozwbl.png",
      "name": "Adidas Black Accent",
      "price": 500000
    },
    {
      "image": "assets/images/ozwmcn.png",
      "name": "Adidas Blue Accent",
      "price": 300000
    },
    {
      "image": "assets/images/ozwp.png",
      "name": "Adidas pink Accent",
      "price": 300000
    },
    {
      "image": "assets/images/ozwpr.png",
      "name": "Adidas Blue pink Accent",
      "price": 300000
    },
    {
      "image": "assets/images/ozwb.png",
      "name": "Adidas Blue Accent",
      "price": 300000
    },
    {
      "image": "assets/images/ozwb.png",
      "name": "Adidas Blue Accent",
      "price": 300000
    },
    {
      "image": "assets/images/ozwb.png",
      "name": "Adidas Blue Accent",
      "price": 300000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.black26,
          flexibleSpace: Container(
            decoration: BoxDecoration(),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 50,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "06",
                        style: TextStyle(
                            fontFamily: "FL",
                            fontSize: 23,
                            color: Colors.white),
                      ),
                      Text(
                        "Barang",
                        style: TextStyle(
                            fontFamily: "FL",
                            fontSize: 23,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 2,
                  color: Colors.black45,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                ),
                Container(
                  child: Text(
                    "Rp. 20000000",
                    style: TextStyle(
                        fontFamily: "D",
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView.builder(
          itemCount: lala.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                CardCart(lala[index]['image'],lala[index]['name'],lala[index]['price']),
              ],
            );
          },
        ),
      ),
    );
  }
}
