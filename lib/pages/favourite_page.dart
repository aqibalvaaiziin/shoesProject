import 'package:flutter/material.dart';
import 'package:shoes/widgets/favourite_page/card_brand.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Favourite Brand",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "D",
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          CardBrand(
            "Adidas Nice Type",
            "This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product",
            "assets/images/ozwp.png",
          ),
          CardBrand(
            "Adidas Nice Type",
            "This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product",
            "assets/images/ozwmcn.png",
          ),
          CardBrand(
            "Adidas Nice Type",
            "This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best productThis is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product",
            "assets/images/ozwb.png",
          ),
        ],
      ),
    );
  }
}
