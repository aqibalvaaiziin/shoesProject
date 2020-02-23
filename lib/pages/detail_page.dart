import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';

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
            child: CustomIcon.back,
          ),
          SizedBox(
            height:50,
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
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 120.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Center(
                child: Container(
                  width: 250,
                  height: 250,
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
              Center(
                child: Hero(
                  tag: widget.shoesImage,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.shoesImage),
                            fit: BoxFit.cover)),
                    height: 250.0,
                    width: 250.0,
                  ),
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '\$.' + widget.shoesPrice.toString(),
                          style: TextStyle(fontSize: 20.0, color: Colors.grey),
                        ),
                        Container(
                          height: 25.0,
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Color(0xff7a9bee),
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
                                      total -= int.parse(
                                          widget.shoesPrice.toString());
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
                                    color: Color(0xff7a9bee),
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
                                    color: Color(0xff7a9bee),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
