import 'package:flutter/material.dart';
import 'package:shoes/factory/profile_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/preference/preferences.dart';
import 'package:shoes/widgets/profile_page/picture_profile.dart';
import 'package:shoes/widgets/profile_page/profile.dart';

import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileFactory data = null;

  void dataProfile() {
    ProfileFactory.setRequest().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  void initState() {
    dataProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          PictureProfile("assets/images/user.png"),
          SizedBox(
            height: 50,
          ),
          Profile(data.name, data.email, data.alamat, data.telp),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditProfilePage();
              },
            ),
          );
        },
        child: CustomIcon.pencil,
      ),
    );
  }
}
