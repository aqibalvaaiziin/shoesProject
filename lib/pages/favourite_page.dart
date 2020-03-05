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
        backgroundColor: Colors.grey[300],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          CardBrand(),
          CardBrand(),
          CardBrand(),
        ],
      ),
    );
  }
}
