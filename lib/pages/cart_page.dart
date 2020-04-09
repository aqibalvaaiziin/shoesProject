import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoes/factory/cart_factory.dart';
import 'package:shoes/redux/app_state.dart';
import 'package:shoes/widgets/cart_page/card_cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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

  @override
  void initState() {
    dataCart();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Belanja"),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey[100],
      body: result.length == 0
          ? SpinKitFadingCube(
              size: 50,
              color: Colors.grey,
            )
          : StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: ListView.builder(
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          return CartCard(
                              result[index].idSepatu,
                              result[index].sepatu['nama'],
                              result[index].sepatu['tipe'],
                              result[index].sepatu['harga'],
                              result[index].jumlah,
                              result[index].sepatu['ukuran'],
                              result[index].sepatu['gambar']);
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ]),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Subtotal (" +
                                      state.dataLengthItem.toString() +
                                      " items)",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontFamily: "M",
                                      color: Colors.grey),
                                ),
                                Text(
                                  "Rp. " + state.dataTotal.toString(),
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontFamily: "M",
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Total Belanja",
                                  style:
                                      TextStyle(fontSize: 20, fontFamily: "F"),
                                ),
                                Text(
                                  "Rp. " + state.dataTotal.toString(),
                                  style:
                                      TextStyle(fontSize: 21, fontFamily: "F"),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(
                                      fontFamily: "F",
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
