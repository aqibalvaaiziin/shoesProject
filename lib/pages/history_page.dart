
import 'package:flutter/material.dart';
import 'dart:convert';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String text = "lala";
  String text2;
  bool status = false;
  void getData() async {
  }

  @override
  void initState() {
    getData();
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text),
              RaisedButton(
                child: Text("pencet"),
                onPressed: () {
                  status = !status;
                  setState(() {});
                },
              ),
              status ? Image.memory(base64Decode(text2)) : Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
