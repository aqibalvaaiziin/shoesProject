import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/favourite_page.dart';
import 'package:shoes/pages/history_page.dart';
import 'package:shoes/pages/home_page.dart';
import 'package:shoes/pages/login_page.dart';
import 'package:shoes/pages/profile_page.dart';
import 'package:shoes/pages/retail_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shoes/redux/app_state.dart';
import 'package:shoes/redux/reducer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final _initalState = AppState();
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initalState);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(AppRun(store: _store));
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
  final Store<AppState> store;
  AppRun({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:
            initialCode == "" || initialCode == null ? '/login' : '/home',
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => MyApp(),
        },
      ),
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
      routes: {
        '/favourite': (context) => FavouritePage(),
        '/history': (context) => HistoryPage(),
        '/profile': (context) => ProfilePage()
      },
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              HomePage(),
              FavouritePage(),
              RetailPage(),
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
