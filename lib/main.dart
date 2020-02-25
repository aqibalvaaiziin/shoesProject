import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/home_page.dart';
import 'package:shoes/pages/profile.dart';

import 'pages/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              HomePage(),
              MainPage(),
              Center(
                  child: Text(
                "19000",
                style: TextStyle(fontSize: 30, fontFamily: "FL"),
              )),
              Center(
                child: ProfilePage(),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.grey[200],
            child: TabBar(
              labelColor: Colors.black,
              indicator: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black),
                  ),
                  color: Colors.white),
              tabs: <Widget>[
                Tab(
                  icon: CustomIcon.home,
                ),
                Tab(
                  icon: CustomIcon.heart,
                ),
                Tab(
                  icon: CustomIcon.bag,
                ),
                Tab(
                  icon: CustomIcon.user,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
