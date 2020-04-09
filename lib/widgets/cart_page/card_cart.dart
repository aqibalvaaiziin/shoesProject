import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shoes/factory/cart_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/redux/app_state.dart';

class CartCard extends StatefulWidget {
  String nama, tipe, gambar;
  int idSepatu, harga, jumlah, ukuran;
  CartCard(this.idSepatu, this.nama, this.tipe, this.harga, this.jumlah,
      this.ukuran, this.gambar);
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int qty = 0;
  var result = List<CartFactory>();
  void dataCart() {
    CartFactory.getData().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
        });
      }
    });
  }

  int totalTrancastion() {
    var total = 0;
    int subtotal = 0;
    for (var i = 0; i < result.length; i++) {
      subtotal = result[i].jumlah * result[i].sepatu['harga'];
      total += subtotal;
    }
    return total;
  }

  int dataItemsLength() {
    var dataLength = 0;
    for (var i = 0; i < result.length; i++) {
      dataLength += result[i].jumlah;
    }
    return dataLength;
  }

  @override
  void initState() {
    dataCart();
    totalTrancastion();
    dataItemsLength();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 191,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 7))
              ],
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.nama,
                        style: TextStyle(
                            fontFamily: "FL",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 170),
                        child: Transform(
                          transform: Matrix4.rotationY(math.pi),
                          child: Image(
                            width: 158,
                            image: MemoryImage(base64Decode(widget.gambar)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 15,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          widget.tipe,
                          style: TextStyle(fontFamily: "D", fontSize: 17),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Size " + widget.ukuran.toString(),
                          style: TextStyle(fontFamily: "D", fontSize: 17),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Rp. " + widget.harga.toString(),
                          style: TextStyle(
                              fontFamily: "D",
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 90,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    if (widget.jumlah > 1) {
                                      await CartFactory.putData(
                                          widget.idSepatu, widget.jumlah - 1);
                                      widget.jumlah -= 1;
                                      state.dataLengthItem = dataItemsLength();
                                      state.dataTotal = totalTrancastion();
                                    }
                                    setState(() {});
                                  },
                                  splashColor: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontFamily: "F",
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                widget.jumlah.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "F",
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await CartFactory.putData(
                                        widget.idSepatu, widget.jumlah + 1);
                                    widget.jumlah += 1;
                                    state.dataLengthItem = dataItemsLength();
                                    state.dataTotal = totalTrancastion();
                                    setState(() {});
                                  },
                                  splashColor: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "F",
                                          color: Colors.white),
                                    ),
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
                Transform.translate(
                  offset: Offset(315, 10),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: InkWell(
                      onTap: () {},
                      child: Center(child: CustomIcon.removeItem),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
