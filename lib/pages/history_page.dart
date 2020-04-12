import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoes/factory/profile_factory.dart';
import 'package:shoes/factory/transaction.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/preference/transaction_preferences.dart';
import 'package:shoes/widgets/history_page/tile_history.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var result = List<TransactionFactory>();
  TransactionPreferences _data = TransactionPreferences();
  int itemLength = 0;
  static double total;
  String name = "";
  String location = "";

  FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
    amount: total,
    settings: MoneyFormatterSettings(
        symbol: 'Rp.',
        thousandSeparator: '.',
        symbolAndNumberSeparator: ' ',
        compactFormatType: CompactFormatType.short),
  );

  // DateTime dataDay = DateTime.parse(result[0].tanggal);
  // var dataDay2 = formatDate(dataDay, [
  //   dd,
  //   '-',
  //   mm,
  //   '-',
  //   yyyy,
  // ]);

  // String name = "";
  // String location = "";
  void getDataProfile() {
    ProfileFactory.setRequest().then((value) {
      setState(() {
        name = value.name;
        location = value.alamat;
      });
    });
  }
  // var result = List<TransactionFactory>();

  void dataCart() {
    total = 0;
    TransactionFactory.getData().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
          total += result[i].total;
        });
      }
    });
  }

  void initCartLength() async {
    itemLength = await _data.getItemsTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}

// Stack(
//               children: <Widget>[
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.3,
//                   padding: EdgeInsets.fromLTRB(20, 60, 20, 30),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                       Colors.blue[200],
//                       Colors.blue[200],
//                       Colors.blueAccent
//                     ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(25),
//                       bottomRight: Radius.circular(25),
//                     ),
//                   ),
//                   child: Center(
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           "Detail Transaksi",
//                           style: TextStyle(
//                               fontFamily: "F",
//                               fontSize: 25,
//                               color: Colors.white),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(name,
//                             style: TextStyle(
//                                 fontFamily: "F",
//                                 fontSize: 25,
//                                 color: Colors.white)),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           location,
//                           style: TextStyle(
//                               fontFamily: "D",
//                               fontWeight: FontWeight.bold,
//                               fontSize: 17,
//                               color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(0, 280),
//                   child: Container(
//                     height: 510,
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     color: Colors.white,
//                     child: ListView.builder(
//                       itemCount: result.length,
//                       itemBuilder: (context, index) {
//                         return TileHistory(
//                           result[index].idTransaksi,
//                           result[index].tanggal,
//                           result[index].total,
//                           result[index].retail['nama'],
//                           result[index].retail['lokasi'],
//                           result[index].retail['telp'],
//                           result[index].status,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(0, 170),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.16,
//                     margin: EdgeInsets.symmetric(horizontal: 50),
//                     padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 10,
//                             offset: Offset(0, 3))
//                       ],
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(15),
//                       ),
//                     ),
//                     child: Center(
//                       child: Column(
//                         children: <Widget>[
//                           Text(
//                             "History Belanja",
//                             style: TextStyle(
//                               fontFamily: "D",
//                               letterSpacing: 2,
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             fmf.output.symbolOnLeft.toString(),
//                             style: TextStyle(
//                                 fontFamily: "F",
//                                 fontSize: 26,
//                                 letterSpacing: 1,
//                                 color: Colors.grey),
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             "Dari 17-12-2020 sampai --",
//                             style: TextStyle(
//                                 fontFamily: "M",
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.grey,
//                                 letterSpacing: 1),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
            //     Transform.translate(
            //       offset: Offset(340, 35),
            //       child:
            //     ),
            //   ],
            // ),
