import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shoes/factory/edit_profile_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/main.dart';
import 'dart:io';
import 'package:image/image.dart' as ImageProcess;
import 'package:shoes/preference/user_preferences.dart';

class EditProfilePage extends StatefulWidget {
  final int idUser;
  EditProfilePage({this.idUser});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  _EditProfilePageState({idUser});
  File _image;
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController telp = TextEditingController();
  String data;
  UserPreferences _dataUser = UserPreferences();

  void open_camera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void open_gallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                top: 70,
                left: 135,
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ),
              Positioned(
                left: 115,
                top: 70,
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _image == null
                          ? AssetImage("assets/images/user.png")
                          : FileImage(_image),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 300, 20, 10),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: nama,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                labelText: "Nama : ",
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                labelText: "E-mail : ",
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
                          TextField(
                            controller: password,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                labelText: "Password : ",
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
                          TextField(
                            controller: alamat,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                labelText: "Alamat : ",
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
                          TextField(
                            controller: telp,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                labelText: "No Telephone : ",
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue),
                              child: Center(
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {
                                      final _imageFile =
                                          ImageProcess.decodeImage(
                                        _image.readAsBytesSync(),
                                      );
                                      String base64Image = base64Encode(
                                          ImageProcess.encodePng(_imageFile));
                                      EditProfileFactory.setRequest(
                                        widget.idUser,
                                        nama.text,
                                        email.text,
                                        password.text,
                                        alamat.text,
                                        telp.text,
                                        _image,
                                      ).then((value) {
                                        data = value;
                                      });
                                      _dataUser.setName(nama.text);
                                      _dataUser.setEmail(email.text);
                                      _dataUser.setPassword(password.text);
                                      _dataUser.setAlamat(alamat.text);
                                      _dataUser.setTelp(telp.text);
                                      _dataUser.setFoto(base64Image);
                                      Alert(
                                          content: CustomIcon.check,
                                          context: context,
                                          style: AlertStyle(
                                              backgroundColor: Colors.grey[200],
                                              animationDuration:
                                                  Duration(milliseconds: 600),
                                              animationType: AnimationType.grow,
                                              titleStyle: TextStyle(
                                                fontSize: 23,
                                                fontFamily: "D",
                                                fontWeight: FontWeight.w700,
                                              ),
                                              isCloseButton: false,
                                              overlayColor: Colors.black87),
                                          title: "Data berhasil di update",
                                          buttons: [
                                            DialogButton(
                                                width: 150,
                                                color: Color(0xaa18c5f5),
                                                child: Text(
                                                  "Kembali ke halaman profile ?",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontFamily: "D",
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyApp()));
                                                }),
                                          ]).show();
                                    },
                                    child: Text(
                                      "SIMPAN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                left: 20,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CustomIcon.back),
              ),
              Positioned(
                top: 215,
                right: 100,
                child: Container(
                  width: 55,
                  height: 55,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  child: GestureDetector(
                      onTap: () {
                        return Alert(
                            context: context,
                            style: AlertStyle(
                                backgroundColor: Colors.grey[200],
                                animationDuration: Duration(milliseconds: 600),
                                animationType: AnimationType.grow,
                                titleStyle: TextStyle(
                                  fontSize: 23,
                                  fontFamily: "FL",
                                  fontWeight: FontWeight.bold,
                                ),
                                isCloseButton: false,
                                overlayColor: Colors.black87),
                            title: "Pilih Salah Satu",
                            buttons: [
                              DialogButton(
                                  color: Color(0xaa18c5f5),
                                  child: Text(
                                    "Galeri",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    open_gallery();
                                  }),
                              DialogButton(
                                  color: Color(0xaa18c5f5),
                                  child: Text(
                                    "Kamera",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    open_camera();
                                  }),
                            ]).show();
                      },
                      child: CustomIcon.camera),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
