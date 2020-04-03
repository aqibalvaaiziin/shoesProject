import 'package:flutter/material.dart';
import 'package:shoes/widgets/favourite_page/top_brand.dart';

class CardBrand extends StatelessWidget {
  String name;
  String desc;
  String image;
  CardBrand(String dataName, String dataDesc, String dataImage) {
    this.name = dataName;
    this.desc = dataDesc;
    this.image = dataImage;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.5,
                color: Colors.grey[300],
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TwoShoes(image),
              Container(
                width: 200,
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            style: TextStyle(
                              fontFamily: "D",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            text: name),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      height: 85,
                      child: RichText(
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: "FL",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          text: desc,
                        ),
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
