import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';

class CardCart extends StatefulWidget {
  final String name;
  final String image;
  final int price;

  CardCart(this.image, this.name, this.price);
  @override
  _CardCartState createState() => _CardCartState(image, name, price);
}

class _CardCartState extends State<CardCart> {
  String name, image;
  int price;
  _CardCartState(this.image, this.name, this.price);
  String qty = "Jumlah";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 70),
            width: MediaQuery.of(context).size.width * .905,
            height: 110,
            decoration: BoxDecoration(
                color: Color(0X525252522),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(100, 35, 20, 10),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "D",
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Rp. " + price.toString(),
                        style: TextStyle(
                            fontFamily: "F", fontSize: 17, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 30,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      color: Colors.black.withOpacity(.7)),
                  child: CustomIcon.remove,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20.4,
          left: 10,
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          ),
        ),
        Positioned(
          top: 87,
          left: 20,
          child: Container(
            width: 70,
            height: 7,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, spreadRadius: 5),
              ],
            ),
          ),
        ),
        Positioned(
          top: 25,
          left: 5,
          child: Image(
            width: 95,
            height: 95,
            image: AssetImage(image),
          ),
        ),
        Positioned(
          top: 110,
          right: 18.5,
          child: Container(
            width: 290,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              color: Color(0x73707073),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: DropdownButton<int>(
                hint: Text(
                  qty,
                  style: TextStyle(
                    fontFamily: "F",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                items: <int>[1, 2, 3, 4, 5].map((int value) {
                  return new DropdownMenuItem<int>(
                    value: value,
                    child: new Text(value.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    qty = newValue.toString();
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
