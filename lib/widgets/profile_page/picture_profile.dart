import 'package:flutter/material.dart';

class PictureProfile extends StatelessWidget {
  String dataImage;
  PictureProfile(String data) {
    this.dataImage = data;
  }
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
                image: AssetImage(dataImage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
