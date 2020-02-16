import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/widgets/detail_page/circle_background.dart';

class DetailPage extends StatefulWidget {
  final shoesImage;
  final shoesName;
  final shoesPrice;

  DetailPage({this.shoesImage, this.shoesName, this.shoesPrice});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CustomIcon.back,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.75,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: <Widget>[
                      BackCircle(),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Transform.rotate(
                          angle: -0.3,
                          child: Image.asset(
                            widget.shoesImage,
                            width: 320,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .6,
                                    child: Text(
                                      widget.shoesName,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Rp. " + widget.shoesPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Transform.translate(
                                offset: Offset(-40, -195),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.7),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          offset: Offset(0, 6))
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          if (counter <= 0)
                                            counter = 0;
                                          else
                                            setState(() {
                                              counter -= 1;
                                            });
                                        },
                                        child: Text(
                                          "-",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        counter.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            counter += 1;
                                          });
                                        },
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(20, 460),
                        child: Container(
                            margin: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  widget.shoesName,
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Text(
                                    "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Labore repudiandae sunt incidunt aliquam. Facilis, fugit ipsa! Omnis soluta consectetur placeat quod nisi, totam eaque aliquid magni fugiat earum dolorum quo?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black38),
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
