import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool isNightMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          IconButton(
              onPressed: () {
                isNightMode = true;
                },
            icon: Icon(Icons.nightlight
            ),
          ),
        ],
      ),
    );
  }
}
