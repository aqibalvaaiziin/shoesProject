import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  IconData icon;
  String title;
  CustomTile(this.icon, this.title);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16.0),
                ),
              )
            ],
          ),
          Icon(Icons.arrow_right)
        ],
      ),
    ));
  }
}
