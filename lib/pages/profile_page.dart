import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/preference/user_preferences.dart';
import 'package:shoes/widgets/profile_page/profile.dart';

import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List _bytesImage;
  String id, name, email, address, phone, foto;
  UserPreferences _userData = UserPreferences();

  void dataProfile() async {
    id = await _userData.getIdUser();
    name = await _userData.getName();
    email = await _userData.getEmail();
    address = await _userData.getAlamat();
    phone = await _userData.getTelp();
    foto = await _userData.getFoto();
    _bytesImage = Base64Decoder().convert(foto);
    setState(() {});
  }

  @override
  void initState() {
    dataProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            _bytesImage == null
                ? Center(
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
                                image: AssetImage("assets/images/user.png")),
                          ),
                        ),
                      ],
                    ),
                  )
                : RotationTransition(
                    turns: AlwaysStoppedAnimation(360 / 4),
                    child: Center(
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
                                  image: MemoryImage(_bytesImage)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: 50,
            ),
            Profile(
              name.toString(),
              email.toString(),
              address.toString(),
              phone.toString(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditProfilePage(idUser: int.parse(id));
              },
            ),
          );
        },
        child: CustomIcon.pencil,
      ),
    );
  }
}
