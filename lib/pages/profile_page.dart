import 'package:flutter/material.dart';
import 'package:shoes/factory/profile_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/widgets/profile_page/picture_profile.dart';
import 'package:shoes/widgets/profile_page/profile.dart';

import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileFactory data = ProfileFactory();
  @override
  void initState() {
    super.initState();
    ProfileFactory.setRequest().then((value) {
      setState(() {
        data = value;
      });
    });
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
            (data.foto == "" || data.foto == "null" || data.foto == null)
                ? PictureProfile("assets/images/user.png")
                : PictureProfile(data.foto),
            SizedBox(
              height: 50,
            ),
            (data == "")
                ? Profile("", "", "", "")
                : Profile(data.name.toString(), data.email.toString(), data.alamat.toString(), data.telp.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditProfilePage(idUser: data.id);
              },
            ),
          );
        },
        child: CustomIcon.pencil,
      ),
    );
  }
}
