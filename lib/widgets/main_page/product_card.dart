import 'package:flutter/material.dart';
import 'package:shoes/pages/detail_page.dart';

class CardProduts extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  CardProduts(this.image, this.name, this.price);
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
      child: Container(
        width: 180,
        height: 180,
        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: 180,
          height: 140,
          child: Stack(
            children: <Widget>[
              Container(
                width: 80,
                height: 15,
                decoration: BoxDecoration(
                ),
              ),
              Transform.translate(
                offset: Offset(-5, -20),
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-20 / 360),
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 160,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rp. " + price.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
