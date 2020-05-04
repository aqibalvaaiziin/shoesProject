import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shoes/factory/cart_factory.dart';
import 'package:shoes/factory/transaction.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/retail_page.dart';
import 'package:shoes/preference/transaction_preferences.dart';
import 'package:shoes/widgets/cart_page/card_cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var result = List<CartFactory>();
  bool animation = false;
  TransactionPreferences _data = TransactionPreferences();
  int itemLength = 0;
  int total = 0;

  FlutterMoneyFormatter fmf2;

  void dataCart() {
    CartFactory.getData().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
        });
      }
    });
  }

  int dataLengthItem() {
    int data = 0;
    CartFactory.getData().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          data += value[i].jumlah;
        });
      }
      _data.setItemsTransaction(data);
      _data.getItemsTransaction().then((value) {
        itemLength = value;
      });
    });
    return data;
  }

  int dataTransaction() {
    int data = 0;
    CartFactory.getData().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          data += value[i].jumlah * value[i].sepatu['harga'];
        });
      }
      _data.setTotalTransaction(data);
      _data.getTotalTransaction().then((value) {
        total = value;
        fmf2 = new FlutterMoneyFormatter(
          amount: total.toDouble(),
          settings: MoneyFormatterSettings(
              symbol: 'Rp.',
              thousandSeparator: '.',
              symbolAndNumberSeparator: ' ',
              compactFormatType: CompactFormatType.short),
        );
      });
    });
    return data;
  }

  void dataInit() async {
    itemLength = await _data.getItemsTransaction();
    total = await _data.getTotalTransaction();
  }

  @override
  void initState() {
    dataCart();
    dataLengthItem();
    dataTransaction();
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
          ? Center(
              child: Text(
                "Keranjang Kosong",
                style: TextStyle(fontFamily: "F", fontSize: 30),
              ),
            )
          : Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: <Widget>[
                          CartCard(
                            result[index].idSepatu,
                            result[index].sepatu['nama'],
                            result[index].sepatu['tipe'],
                            result[index].sepatu['harga'],
                            result[index].jumlah,
                            result[index].sepatu['ukuran'],
                            result[index].sepatu['gambar'],
                          ),
                          Transform.translate(
                            offset: Offset(250, 60),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    height: 90,
                                  ),
                                  Container(
                                    width: 90,
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              if (result[index].jumlah > 1) {
                                                await CartFactory.putData(
                                                    result[index].idSepatu,
                                                    result[index].jumlah - 1);

                                                result[index].jumlah -= 1;
                                              }
                                              dataLengthItem();
                                              dataTransaction();
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
                                          result[index].jumlah.toString(),
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
                                                  result[index].idSepatu,
                                                  result[index].jumlah + 1);
                                              result[index].jumlah += 1;
                                              dataLengthItem();
                                              dataTransaction();
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
                            offset: Offset(345, 30),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(4, 3))
                                  ]),
                              child: InkWell(
                                onTap: () {
                                  Alert(
                                      content: CustomIcon.trash,
                                      context: context,
                                      style: AlertStyle(
                                          backgroundColor: Colors.grey[200],
                                          animationDuration:
                                              Duration(milliseconds: 600),
                                          animationType: AnimationType.grow,
                                          titleStyle: TextStyle(
                                            fontSize: 23,
                                            fontFamily: "D",
                                            fontWeight: FontWeight.w700,
                                          ),
                                          isCloseButton: false,
                                          overlayColor: Colors.black87),
                                      title: "Hapus data dari Keranjang",
                                      buttons: [
                                        DialogButton(
                                            width: 150,
                                            color: Color(0xaa18c5f5),
                                            child: Text(
                                              "Hapus",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: "D",
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            onPressed: () async {
                                              await CartFactory.delData(
                                                  result[index].idSepatu);
                                              result.clear();
                                              dataCart();
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                              dataTransaction();
                                              dataLengthItem();
                                            }),
                                      ]).show();
                                },
                                child: Center(child: CustomIcon.removeItem),
                              ),
                            ),
                          )
                        ],
                      );
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
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Subtotal (" + itemLength.toString() + " items)",
                              style: TextStyle(
                                  fontSize: 21,
                                  fontFamily: "M",
                                  color: Colors.grey),
                            ),
                            Text(
                              fmf2.output.symbolOnLeft.toString(),
                              style: TextStyle(
                                  fontSize: 21,
                                  fontFamily: "M",
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Total Belanja",
                              style: TextStyle(fontSize: 20, fontFamily: "F"),
                            ),
                            Text(
                              fmf2.output.symbolOnLeft.toString(),
                              style: TextStyle(fontSize: 21, fontFamily: "F"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Alert(
                                content: CustomIcon.question,
                                context: context,
                                style: AlertStyle(
                                    backgroundColor: Colors.grey[200],
                                    animationDuration:
                                        Duration(milliseconds: 600),
                                    animationType: AnimationType.grow,
                                    titleStyle: TextStyle(
                                      fontSize: 23,
                                      fontFamily: "D",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    isCloseButton: false,
                                    overlayColor: Colors.black87),
                                title:
                                    "Apakah anda ingin melanjutkan pembelian ?",
                                buttons: [
                                  DialogButton(
                                      child: Text("Lanjutkan"),
                                      onPressed: () {
                                        TransactionFactory.postTransaction()
                                            .then((value) {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      RetailPage(
                                                          idTransaksi: value
                                                              .idTransaksi)));
                                        });
                                        setState(() {});
                                      })
                                ]).show();
                          },
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
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}