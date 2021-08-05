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

    Color? bnColor = isNightMode ? Colors.deepPurple[900] : Colors.red;
    Color? bgColor = isNightMode ? Colors.blueGrey[900] : Colors.white;
    Color? txColor = isNightMode ? Colors.black : Colors.white;


    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Settings',
          style: TextStyle(color: txColor),
        ),
        backgroundColor: bnColor,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isNightMode = !isNightMode;
                  });
                  },
              icon: Icon(Icons.nightlight,
                color: bnColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
