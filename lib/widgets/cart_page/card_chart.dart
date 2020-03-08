import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';

class CardChart extends StatefulWidget {
  @override
  _CardChartState createState() => _CardChartState();
}

class _CardChartState extends State<CardChart> {
  String sizeValue = "Jumlah";
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
                        "Nama Sepatu Nama SepatuNama ",
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
                        "Harga",
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
            image: AssetImage("assets/images/ozwmcn.png"),
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
              child: DropdownButton<String>(
                hint: Text(
                  sizeValue,
                  style: TextStyle(
                    fontFamily: "F",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    sizeValue = newValue;
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
