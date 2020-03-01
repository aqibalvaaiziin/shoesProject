import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';

class CardChart extends StatefulWidget {
  @override
  _CardChartState createState() => _CardChartState();
}

class _CardChartState extends State<CardChart> {
  String sizeValue = "Ukuran";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width * .905,
            height: 110,
            decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(100, 23, 20, 10),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Nama Sepatu Nama SepatuNama Sepatu",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "D",
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Harga",
                        style: TextStyle(
                            fontFamily: "F", fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 30,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5)),
                        color: Colors.black.withOpacity(.7)),
                    child: CustomIcon.remove),
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
            image: AssetImage("assets/images/ozwbl.png"),
          ),
        ),
      ],
    );
  }
}
