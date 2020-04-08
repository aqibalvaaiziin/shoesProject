import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shoes/pages/edit_profile_page.dart';
import 'package:shoes/redux/app_state.dart';
import 'package:shoes/widgets/MyApp/tile.dart';
import 'package:shoes/widgets/profile_page/profile.dart';

import '../factory/profile_factory.dart';
import '../preference/user_preferences.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name, email, address, phone, foto;
  int id;
  ProfileFactory data;
  UserPreferences _data = UserPreferences();

  void getDataProfile() {
    ProfileFactory.setRequest().then((value) {
      setState(() {
        data = value;
        _data.setIdUser(data.idUser);
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
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.grey,
          ),
          drawer: Drawer(
            elevation: 5,
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Material(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image(
                          width: 80,
                          height: 80,
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(
                            idUser: id,
                          ),
                        ),
                      );
                    },
                    child: CustomTile(Icons.edit, "Edit Profile")),
                GestureDetector(
                    onTap: () {
                      _data.setTokenCode(null);
                      _data.setTokenType(null);
                      state.isLogedIn = null;
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (Route<dynamic> route) => false);
                    },
                    child: CustomTile(Icons.lock_open, "Log Out")),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
        );
      },
    );
  }
}
