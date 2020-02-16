import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';

class PictureProfile extends StatefulWidget {
  @override
  _PictureProfileState createState() => _PictureProfileState();
}

class _PictureProfileState extends State<PictureProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40),
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/zayn-malik-1.jpg"),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 55,
              height: 55,
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              child: CustomIcon.camera,
            ),
          )
        ],
      ),
    );
  }
}
