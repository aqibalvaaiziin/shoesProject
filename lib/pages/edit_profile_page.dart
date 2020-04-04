import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shoes/factory/edit_profile_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/main.dart';
import 'dart:io';

import '../icons/icon.dart';
import 'MyApp.dart';

class EditProfilePage extends StatefulWidget {
  final int idUser;
  EditProfilePage({this.idUser});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  _EditProfilePageState({idUser});
  File _image;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController telp = TextEditingController();
  bool isError = false;
  String response;

  void _dataSend() async {
    response = await EditProfileFactory.putData(
      widget.idUser,
      name.text,
      email.text,
      password.text,
      address.text,
      telp.text,
      _image,
    );

    if (response == null)
      isError = false;
    else
      isError = true;
  }

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
              Container(
                margin: EdgeInsets.only(top: 110),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
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
                            controller: name,
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
                            controller: address,
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
                                      _dataSend();
                                      setState(() {});
                                      isError
                                          ? Alert(
                                              content: CustomIcon.check,
                                              context: context,
                                              style: AlertStyle(
                                                  backgroundColor:
                                                      Colors.grey[200],
                                                  animationDuration: Duration(
                                                      milliseconds: 600),
                                                  animationType:
                                                      AnimationType.grow,
                                                  titleStyle: TextStyle(
                                                    fontSize: 23,
                                                    fontFamily: "D",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  isCloseButton: false,
                                                  overlayColor: Colors.black87),
                                              title: "Update Berhasil",
                                              buttons: [
                                                  DialogButton(
                                                      width: 150,
                                                      color: Color(0xaa18c5f5),
                                                      child: Text(
                                                        "Kembali ke toko ?",
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontFamily: "D",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MyApp()));
                                                      }),
                                                ]).show()
                                          : Alert(
                                              context: context,
                                              content: CustomIcon.remove,
                                              style: AlertStyle(
                                                  backgroundColor:
                                                      Colors.grey[200],
                                                  animationDuration: Duration(
                                                      milliseconds: 600),
                                                  animationType:
                                                      AnimationType.grow,
                                                  titleStyle: TextStyle(
                                                    fontSize: 23,
                                                    fontFamily: "FL",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  isCloseButton: false,
                                                  overlayColor: Colors.black87),
                                              title: "Gagal mengubah profile",
                                            ).show();
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
                right: 110,
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

  Widget message(String message1, String message2, Widget icon) {
    Alert(
        content: icon,
        context: context,
        style: AlertStyle(
            backgroundColor: Colors.grey[200],
            animationDuration: Duration(milliseconds: 600),
            animationType: AnimationType.grow,
            titleStyle: TextStyle(
              fontSize: 23,
              fontFamily: "D",
              fontWeight: FontWeight.w700,
            ),
            isCloseButton: false,
            overlayColor: Colors.black87),
        title: message1,
        buttons: [
          DialogButton(
              width: 210,
              color: Color(0xaa18c5f5),
              child: Text(
                message2,
                style: TextStyle(
                    fontSize: 17, fontFamily: "D", fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              }),
        ]).show();
  }
}
