import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/favourite_page.dart';
import 'package:shoes/pages/history_page.dart';
import 'package:shoes/pages/home_page.dart';
import 'package:shoes/pages/login_page.dart';
import 'package:shoes/pages/profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(AppRun());
    },
  );
}

String initialCode;

void setCode() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("initCode", "login");
}

Future<String> getCode() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("initCode") ?? null;
}

class AppRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialCode == "" || initialCode == null ? '/home' : '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => MyApp(),
      },
    );
  }
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
              FavouritePage(),
              HistoryPage(),
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
