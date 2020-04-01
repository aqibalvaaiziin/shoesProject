import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/widgets/profile_page/profile.dart';

import '../factory/profile_factory.dart';
import '../preference/user_preferences.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name, email, address, phone, foto;
  int id;
  ProfileFactory data = null;
  UserPreferences _data = UserPreferences();

  void getDataProfile() {
    ProfileFactory.setRequest().then((value) {
      setState(() {
        data = value;
        _data.setIdUser(data.id);
      });
      setState(() async {
        id = await _data.getIdUser();
      });
    });
  }

  @override
  void initState() {
    getDataProfile();
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
            Center(
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
                        image: MemoryImage(base64Decode(data.foto)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Profile(
              data.name,
              data.email,
              data.alamat,
              data.telp,
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
                return EditProfilePage(idUser: id);
              },
            ),
          );
        },
        child: CustomIcon.pencil,
      ),
    );
  }
}
