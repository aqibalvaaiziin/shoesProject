import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/retail_page.dart';
import 'package:shoes/redux/app_state.dart';

import 'favourite_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WillPopScope(
            onWillPop: () => Future.value(false),
            child: DefaultTabController(
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
          ),
        );
      },
    );
  }
}
