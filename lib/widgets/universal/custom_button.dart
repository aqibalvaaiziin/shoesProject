import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';

class CustomButton extends StatefulWidget {
  Color bd;
  Color tc;
  String text;
  @override
  _CustomButtonState createState() => _CustomButtonState(bd, tc, text);
  CustomButton(this.bd, this.tc, this.text);
}

class _CustomButtonState extends State<CustomButton> {
  Color bd;
  Color tc;
  String text;
  _CustomButtonState(this.bd, this.tc, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: 110,
            height: 50,
            decoration: BoxDecoration(
              color: bd,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                          color: tc,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: "nhl"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomIcon.right
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
