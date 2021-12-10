// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            bottomNavigationBar: BottomNavigationBar(items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: 'Messages')
            ], currentIndex: _selectedIndex, onTap: _onItemTapped),
            body: Center(child: _pages.elementAt(_selectedIndex))));
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
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
        "DMs have not yet been implemented in FerrisChat",
        textAlign: TextAlign.center,
      ))),
    );
  }
}
