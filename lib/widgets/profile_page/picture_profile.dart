import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
                image:
                    AssetImage("assets/images/user.png")
              ),
            ),
          ),
        ],
      ),
    );
  }
}
