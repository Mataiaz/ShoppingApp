import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  get isNightMode => false;

  //final bool? isNightMode;

  //Settings({@required this.isNightMode});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static bool isNightMode = true;

  @override
  Widget build(BuildContext context) {
    Color bnColor = isNightMode ? Colors.deepPurple[900] : Colors.red;
    Color bgColor = isNightMode ? Colors.blueGrey[900] : Colors.white;
    Color txColor = isNightMode ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: txColor),
        ),
        backgroundColor: bnColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                setState(() {
                  isNightMode = !isNightMode;
                });
              },
              icon: Icon(
                Icons.nightlight,
                color: bnColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context, {
                  isNightMode = true,
                });
              },
              icon: Icon(Icons.edit_location),
            ),
          ],
        ),
      ),
    );
  }
}
