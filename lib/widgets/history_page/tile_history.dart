import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shoes/icons/icon.dart';
import 'package:date_format/date_format.dart';

class TileHistory extends StatefulWidget {
  String idTransaksi, tanggal, nama, lokasi, telp;
  int total;
  bool status;
  TileHistory(this.idTransaksi, this.tanggal, this.total, this.nama,
      this.lokasi, this.telp, this.status);
  @override
  _TileHistoryState createState() => _TileHistoryState();
}

class _TileHistoryState extends State<TileHistory> {
  @override
  Widget build(BuildContext context) {
    DateTime dataDay = DateTime.parse(widget.tanggal);
    var dataDay2 = formatDate(
        dataDay, [dd, '-', mm, '-', yyyy, ' ', hh, ':', nn, ':', ss, ' ', am]);
    FlutterMoneyFormatter fmf2 = new FlutterMoneyFormatter(
      amount: widget.total.toDouble(),
      settings: MoneyFormatterSettings(
          symbol: 'Rp.',
          thousandSeparator: '.',
          symbolAndNumberSeparator: ' ',
          compactFormatType: CompactFormatType.short),
    );
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.177,
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 5,
            offset: Offset(2, 3),
          )
        ]),
        child: Row(
          children: <Widget>[
            Container(
              width: 90,
              child: Column(
                children: <Widget>[
                  widget.status == true ? CustomIcon.warning : CustomIcon.check,
                  SizedBox(
                    height: 9,
                  ),
                  widget.status == true
                      ? Text(
                          "Dalam Proses",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "F",
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "Transaksi Selesai",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "F",
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.594,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.idTransaksi,
                    style: TextStyle(
                        fontFamily: "FL",
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    dataDay2,
                    style: TextStyle(
                        fontFamily: "D",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.nama,
                    style: TextStyle(
                        fontFamily: "D",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                  Text(
                    widget.lokasi,
                    style: TextStyle(
                        fontFamily: "D",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                  Text(
                    widget.telp,
                    style: TextStyle(
                        fontFamily: "D",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        fmf2.output.symbolOnLeft.toString(),
                        style: TextStyle(fontFamily: "F", fontSize: 18),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
