import 'package:flutter/material.dart';
import 'package:shoes/widgets/profile_page/picture_profile.dart';
import 'package:shoes/widgets/profile_page/profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PictureProfile(),
          SizedBox(height: 50,),
          Profile()
        ],
      ),
    );
  }
}
