import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/cart_page.dart';
import 'package:shoes/widgets/main_page/product_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var lala = [
    {
      "image": "assets/images/ozwb.png",
      "name": "Adidas Biru",
      "price": 2100000,
      "isFav": true
    },
    {
      "image": "assets/images/ozwbl.png",
      "name": "Adidas Hitam",
      "price": 2300000,
      "isFav": false
    },
    {
      "image": "assets/images/ozwp.png",
      "name": "Adidas Pink",
      "price": 500000,
      "isFav": true
    },
    {
      "image": "assets/images/ozwpr.png",
      "name": "Adidas Black Pink",
      "price": 3300000,
      "isFav": false
    },
    {
      "image": "assets/images/ozwmcn.png",
      "name": "Adidas Macan",
      "price": 1700000,
      "isFav": true
    },
  ];
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          print("object");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        },
        child: Container(
          width: 250,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "Jumlah Item yang dibeli : 5",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "D",
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
      body: ListView(
        children: <Widget>[
          Column(
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
                  children: lala.map((data) {
                    return CardProducts(data['image'], data['name'],
                        data['price'], data['isFav']);
                  }).toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
