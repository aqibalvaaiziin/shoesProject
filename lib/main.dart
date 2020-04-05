import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes/pages/detail_page.dart';
import 'package:shoes/pages/login_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
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

class _AppRunState extends State<AppRun> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          dataRoute = state.isLogedIn;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: state.isLogedIn == "Im login" ? '/home' : '/login',
            routes: {
              '/login': (context) => LoginPage(),
              '/home': (context) => MyApp(),
            },
            home: MyApp(),
          );
        },
      ),
    );
  }
}
