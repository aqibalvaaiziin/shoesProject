import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shoes/factory/profile_factory.dart';
import 'package:shoes/factory/transaction.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/preference/transaction_preferences.dart';
import 'package:shoes/widgets/history_page/tile_history.dart';

import 'cart_page.dart';

class HTransactionPage extends StatefulWidget {
  @override
  _HTransactionPageState createState() => _HTransactionPageState();
}

class _HTransactionPageState extends State<HTransactionPage> {
  var result = List<TransactionFactory>();
  static double total;
  String name = "";
  String location = "";
  DateTime dataDay;
  String dataDay2;
  int itemLength = 0;
  TransactionPreferences _data = TransactionPreferences();

  void getDataProfile() {
    ProfileFactory.setRequest().then((value) {
      setState(() {
        name = value.name;
        location = value.alamat;
      });
    });
  }

  void initCartLength() async {
    itemLength = await _data.getItemsTransaction();
  }

  void dataTransaction() {
    total = 0;
    TransactionFactory.getData().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
          total += result[i].total;
        });
      }
      if (value.length > 0) {
        dataDay = DateTime.parse(result[0].tanggal);
        dataDay2 = formatDate(dataDay, [
          dd,
          ' - ',
          mm,
          ' - ',
          yyyy,
        ]);
      } else {
        dataDay2 = "----";
      }
    });
  }

  @override
  void initState() {
    dataTransaction();
    getDataProfile();
    initCartLength();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue[200],
              Colors.blueGrey,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            padding: EdgeInsets.fromLTRB(20, 80, 20, 10),
            child: Column(
              children: <Widget>[
                Text(
                  "Detail Transaksi",
                  style: TextStyle(
                      fontFamily: "F", fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: "F", fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  location,
                  style: TextStyle(
                      fontFamily: "M", fontSize: 17, color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 298,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.white,
              child: result.length == 0
                  ? Center(
                      child: Text(
                      "Belum Ada Transaksi",
                      style: TextStyle(fontSize: 30, fontFamily: "F"),
                    ))
                  : ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return TileHistory(
                            result[index].idTransaksi,
                            result[index].tanggal,
                            result[index].total,
                            result[index].retail['nama'],
                            result[index].retail['lokasi'],
                            result[index].retail['telp'],
                            result[index].status);
                      },
                    ),
            ),
          ),
          Positioned(
            top: 190,
            left: 40,
            right: 40,
            child: dataAllTransaction(context, total, dataDay2),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: cartButton(context, itemLength),
          )
        ],
      ),
    );
  }
}

Widget dataAllTransaction(
    BuildContext context, double dataTotal, String tanggal) {
  FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
    amount: dataTotal,
    settings: MoneyFormatterSettings(
        symbol: 'Rp.',
        thousandSeparator: '.',
        symbolAndNumberSeparator: ' ',
        compactFormatType: CompactFormatType.short),
  );
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: MediaQuery.of(context).size.height * 0.15,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Total Pembelanjaan",
          style: TextStyle(fontSize: 15, fontFamily: "F", color: Colors.grey),
        ),
        Text(
          fmf.output.symbolOnLeft.toString(),
          style: TextStyle(fontSize: 25, fontFamily: "F", color: Colors.grey),
        ),
        Text(
          "$tanggal    Sampai    ----  ",
          style: TextStyle(
              fontSize: 15,
              fontFamily: "M",
              color: Colors.grey,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget cartButton(BuildContext context, int dataLength) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CartPage(),
        ),
      );
    },
    child: Container(
      child: Column(
        children: <Widget>[
          CustomIcon.bagW,
          Transform.translate(
            offset: Offset(15, -25),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  dataLength.toString(),
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    fontFamily: "F",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
