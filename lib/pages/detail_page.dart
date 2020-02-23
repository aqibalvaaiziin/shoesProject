import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/widgets/detail_page/size_shoes.dart';

class DetailPage extends StatefulWidget {
  final shoesImage;
  final shoesName;
  final shoesPrice;

  DetailPage({this.shoesImage, this.shoesName, this.shoesPrice});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var counter = 0;
  var total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf4f6fb),
      body: ListView(
        children: [
          Transform.translate(
            offset: Offset(-165, 20),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CustomIcon.back),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              widget.shoesName,
              style: TextStyle(fontFamily: "NHL2", fontSize: 25),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 120.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Center(
                child: Container(
                  width: 330,
                  height: 330,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
              Positioned(
                top: 160,
                right: 100,
                child: Container(
                  width: 200,
                  height: 15,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 13)],
                  ),
                ),
              ),
              Positioned(
                top: -40,
                left: 20,
                child: Center(
                  child: Hero(
                    tag: widget.shoesImage,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.shoesImage),
                              fit: BoxFit.cover)),
                      height: 350.0,
                      width: 350.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 20,
                right: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 1,
                  color: Colors.grey[200],
                ),
              ),
              Positioned(
                top: 250,
                left: 22,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Deskripsi",
                        style: TextStyle(fontFamily: 'F', color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Lorem ipsum  Facilis, fugit ipsa! Omnis soluta consectetur placeat quod nisi, totam eaque aliquid magni fugiat earum dolorum quo?",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 350,
                left: 20,
                right: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 1,
                  color: Colors.grey[200],
                ),
              ),
              Positioned(
                top: 370,
                left: 22,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.702,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Ukuran",
                        style: TextStyle(fontFamily: 'F', color: Colors.grey),
                      ),
                      Text(
                        "Jumlah",
                        style: TextStyle(fontFamily: 'F', color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 392,
                left: 15,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            SizeShoes("40", true),
                            SizeShoes("43", false),
                            SizeShoes("44", false),
                          ],
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 25,
                        color: Colors.grey,
                      ),
                      Container(
                        width: 125.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(11.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (counter <= 0) {
                                    counter = 0;
                                  } else {
                                    counter -= 1;
                                    total -=
                                        int.parse(widget.shoesPrice.toString());
                                  }
                                });
                              },
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black54,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Text(
                              counter.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  counter += 1;
                                  total +=
                                      int.parse(widget.shoesPrice.toString());
                                });
                              },
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black54,
                                  size: 20.0,
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
              Positioned(
                top: 500,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image(
                        width: 150,
                        height: 150,
                        image: AssetImage("assets/images/adidas.png"),
                      ),
                      Container(
                        width: 170,
                        height: 100,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomIcon.cart,
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Add To Cart +",
                              style: TextStyle(
                                fontFamily: "NHL",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(280, 470),
                child: Image(
                  width: 100,
                  height: 100,
                  image: AssetImage("assets/images/adidascart.png"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
