import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width * 0.87,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(100, 23, 20, 10),
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Nama Sepatu Nama SepatuNama Sepatu",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "D",
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Harga",
                          style: TextStyle(fontFamily: "F", fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 10,
                child: Container(
                  width: 90,
                  height: 90,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 147,
                left: 22,
                child: Container(
                  width: 68,
                  height: 5,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          spreadRadius: 2),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 85,
                left: 8,
                child: Image(
                  width: 95,
                  height: 95,
                  image: AssetImage("assets/images/ozwbl.png"),
                ),
              ),
              Positioned(
                left: 25.4,
                top: 160,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.871,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  color: Colors.black38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: DropdownButton<String>(
                          hint: Text("Ukuran"),
                          items:
                              <String>['A', 'B', 'C', 'D'].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                      CustomIcon.remove
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
