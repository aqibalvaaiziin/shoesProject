import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/widgets/main_page/product_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFf4f6fb),
        flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
          child: TextField(
            controller: search,
            decoration: InputDecoration(
              suffix: CustomIcon.search,
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 20, fontFamily: "FL"),
              counterStyle: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFf4f6fb),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "234 Result",
                  style: TextStyle(fontSize: 20, fontFamily: "FL"),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width - 60,
                height: 2,
                color: Colors.grey[300],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Wrap(
                children: <Widget>[
                  CardProducts(
                      "assets/images/ozwb.png", "Adidas Bagus", 30000, true),
                  CardProducts(
                      "assets/images/ozwbl.png", "Adidas Bagus", 30000, false),
                  CardProducts(
                      "assets/images/ozwmcn.png", "Adidas Bagus", 30000, false),
                  CardProducts(
                      "assets/images/ozwp.png", "Adidas Bagus", 30000, true),
                  CardProducts(
                      "assets/images/ozwpr.png", "Adidas Bagus", 30000, true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
