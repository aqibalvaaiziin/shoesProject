import 'package:flutter/material.dart';
import 'package:shoes/widgets/favourite_page/card_brand.dart';

class FavouritePage extends StatelessWidget {
  var lala = [
    {
      "name": "Adidas Nice Type",
      "desc":
          "This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product",
      "image": "assets/images/ozwpr.png"
    },
    {
      "name": "Adidas Nice Type",
      "desc":
          "This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product",
      "image": "assets/images/ozwp.png"
    },
    {
      "name": "Adidas Nice Type",
      "desc":
          "This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product",
      "image": "assets/images/ozwbl.png"
    },
    {
      "name": "Adidas Nice Type",
      "desc":
          "This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product This is is a good product we have and now you can feel our best product",
      "image": "assets/images/ozwmcn.png"
    },
    
  ];

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
      body: ListView.builder(
        itemCount: lala.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              CardBrand(
                lala[index]['name'],
                lala[index]['desc'],
                lala[index]['image'],
              ),
            ],
          );
        },
      ),
    );
  }
}
