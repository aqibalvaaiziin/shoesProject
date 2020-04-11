import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes/pages/login_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shoes/preference/user_preferences.dart';
import 'package:shoes/redux/app_state.dart';
import 'package:shoes/redux/reducer.dart';

import 'pages/MyApp.dart';

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

String dataRoute;

class AppRun extends StatefulWidget {
  final Store<AppState> store;
  AppRun({this.store});
  @override
  _AppRunState createState() => _AppRunState();
}

Future<bool> dataLogin() async {
  UserPreferences _data = UserPreferences();
  var data1 = await _data.getTokenCode();
  var data2 = await _data.getTokenType();
  bool result = data1 != null && data2 != null;
  return result;
}

class _AppRunState extends State<AppRun> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: dataLogin() == true ? '/home' : '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => MyApp(),
        },
        home: MyApp(),
      ),
    );
  }
}
