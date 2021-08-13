import 'package:flutter/material.dart';
import 'package:shopping_app/pages/settings.dart';

class NavigationDrawerWidget extends StatefulWidget {

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {

  Color? bnColor = Settings().isNightMode ? Colors.deepPurple[900] : Colors.red;
  Color? bgColor = Settings().isNightMode ? Colors.blueGrey[900] : Colors.white;
  Color? txColor = Settings().isNightMode ? Colors.black : Colors.red;

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.2, // % of screen
        child: Drawer(
          child: Container(
            color: bgColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  //Text('SLIDE PANEL',
                    //style: TextStyle(color: txColor),
                 // ),
                  SizedBox (height: 60),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout'); //Button > push to location name (location name set in main)
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: bnColor,
                    ),
                  ),
                  Text('Checkout'),
                  SizedBox (height: 60),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/history');
                    },
                    icon: Icon(
                      Icons.book,
                      color: bnColor,
                    ),
                  ),
                  Text('History'),
                  SizedBox (height: 80),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/help');
                    },
                    icon: Icon(
                      Icons.help,
                      color: bnColor,
                    ),
                  ),
                  Text('Help'),
                  SizedBox (height: 60),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    icon: Icon(
                      Icons.settings,
                      color: bnColor,
                    ),
                  ),
                  Text('Settings'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}