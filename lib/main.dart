// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import './login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var route;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey("ferris-token") != true) {
    route = "/login";
  } else {
    route = "/";
  }
  runApp(MyApp(route: route));
}

class MyApp extends StatefulWidget {
  final String? route;
  const MyApp({Key? key, this.route}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: widget.route,
      navigatorKey: _navigatorKey,
      routes: {'/': (context) => HomePage(), '/login': (context) => Login()},
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[Home(), DMS()];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("FerrisChat"),
              backgroundColor: Colors.orange,
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.message), label: 'Messages')
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                selectedItemColor: Colors.orange),
            body: Center(child: _pages.elementAt(_selectedIndex))));
  }
}

class DMS extends StatefulWidget {
  @override
  State<DMS> createState() => _DMSState();
}

class _DMSState extends State<DMS> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Text(
        "As of the 10/12/2021 DMs have not been implemented in FerrisChat",
        textAlign: TextAlign.center,
      ))),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold());
  }
}
