import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/detail_page.dart';

class CardProducts extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  bool isFav;
  CardProducts(this.image, this.name, this.price, this.isFav);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
                shoesImage: image, shoesName: name, shoesPrice: price),
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            width: MediaQuery.of(context).size.width * 0.45,
            height: 300,
            color: Color(0xFFf4f6fb),
          ),
          Positioned(
            top: 3,
            left: 5,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 200,
              color: Colors.grey[200],
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 40,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      image,
                      width: 165,
                      height: 230,
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
                    "Rp. " + price.toString(),
                    style: TextStyle(fontFamily: "F", fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 35,
              right: 15,
              child: !isFav ? CustomIcon.outlineHeart : CustomIcon.redHeart)
        ],
      ),
    );
  }
}
