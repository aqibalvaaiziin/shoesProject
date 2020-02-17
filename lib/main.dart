import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/home_page.dart';
import 'package:shoes/pages/profile.dart';
import 'package:shoes/widgets/universal/custom_button.dart';

import 'pages/main_page.dart';

void main() => runApp(MyApp());

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
          appBar: AppBar(
            title: Center(
                child: Image(
              image: AssetImage("assets/images/an.png"),
              width: 230,
            )),
            backgroundColor: Color(0xFFf4f6fb),
            bottom: TabBar(
              indicator: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
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
          body: TabBarView(
            children: <Widget>[
              HomePage(),
              MainPage(),
              CustomButton(Colors.red, Colors.white, "lala"),
              Center(
                child: ProfilePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
