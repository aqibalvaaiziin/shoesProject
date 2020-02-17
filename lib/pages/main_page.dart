import 'package:flutter/material.dart';
import 'package:shoes/widgets/main_page/head_page.dart';
import 'package:shoes/widgets/main_page/product_card.dart';
import 'package:shoes/widgets/main_page/top_brand.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf4f6fb),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeadPage(),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.3),
              child: Wrap(
                children: <Widget>[
                  CardProduts(
                      "assets/images/adidas1.png", "Black Yezzy", 5000000),
                  CardProduts(
                      "assets/images/adidas2.png", "Green Yezzy", 6000000),
                  CardProduts(
                      "assets/images/adidas3.png", "Adidas 34CX", 3000000),
                  CardProduts(
                      "assets/images/adidas4.png", "Adidas 23CTR", 1000000),
                  CardProduts(
                      "assets/images/adidas5.png", "Adidas 56Cw", 2000000),
                  CardProduts(
                      "assets/images/adidas7.png", "Adidas 5436C", 6000000),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TopBrand(),
          ],
        ),
      ),
    );
  }
}
