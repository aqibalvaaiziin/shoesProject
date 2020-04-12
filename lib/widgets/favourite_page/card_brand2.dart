import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shoes/widgets/favourite_page/top_brand2.dart';

class CardBrand2 extends StatelessWidget {
  String name;
  String desc;
  String image;
  int price;
  CardBrand2(String dataName, String dataDesc, String dataImage, int price) {
    this.name = dataName;
    this.desc = dataDesc;
    this.image = dataImage;
    this.price = price;
  }
  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf2 = new FlutterMoneyFormatter(
      amount: price.toDouble(),
      settings: MoneyFormatterSettings(
          symbol: 'Rp.',
          thousandSeparator: '.',
          symbolAndNumberSeparator: ' ',
          compactFormatType: CompactFormatType.short),
    );
    return Container(
      width: MediaQuery.of(context).size.width,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10),
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
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            fmf2.output.symbolOnLeft.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "AD",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              TwoShoes2(image),
            ],
          ),
        ),
      ),
    );
  }
}
