import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Settings extends StatefulWidget {
  final dynamic? pcon;
  const Settings({Key? key, this.pcon}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    TextEditingController newPasswordController = TextEditingController();

    return MaterialApp(
        home: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(bottom: 5.0),
              width: 0,
              child: RaisedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove("ferris-token");
                    var nav = Navigator.of(widget.pcon);
                    nav.pushNamed("/login");
                  },
                  child: Text("Log Off"),
                  color: Colors.orange),
            ),
            Row(
              children: [
                Container(
                  width: 250,
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    controller: newPasswordController,
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.orange,
                    child: Text('Change Password'),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      var r = await http.patch(
                          Uri.parse("https://api.ferris.chat/v0/users/me"),
                          body: jsonEncode(
                              {"passowrd": newPasswordController.text}),
                          headers: {
                            "Content-Type": "application/json",
                            "Authorization": prefs.getString("ferris-token")
                          });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
