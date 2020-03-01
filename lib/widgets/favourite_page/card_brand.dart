import 'package:flutter/material.dart';
import 'package:shoes/widgets/favourite_page/top_brand.dart';

class CardBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 7,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            children: <Widget>[
              TwoShoes(),
              Container(
                width: 200,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Nama Brand",
                      style: TextStyle(
                        fontFamily: "D",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Deskripsi yang cukup panjangDeskripsi yang cukup panjang",
                      style: TextStyle(
                        fontFamily: "FL",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
