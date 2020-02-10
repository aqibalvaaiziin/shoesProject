import 'package:flutter/material.dart';

class TopBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Best Seller Item",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: double.infinity,
            height: 165,
            padding: EdgeInsets.only(top: 20, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 160,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Adidas CrGh87",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 160,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Facilis, fugit ipsa! Omnis soluta consectetur placea earum dolorum quo?",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Stack(children: <Widget>[
                  Positioned(
                    right: 7,
                    top: 110,
                    child: Transform.rotate(
                      angle: -0.1,
                      child: Container(
                        width: 170,
                        height: 10,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.6),
                              blurRadius: 10,
                              offset: Offset(0, -7))
                        ]),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(3, 10),
                    child: Image.asset(
                      "assets/images/adidas6.png",
                      width: 200,
                      height: 180,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
