import 'package:flutter/material.dart';
import 'package:shopping_app/pages/settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Text('THIS IS HOME WERE WILL BE ABLE TO SEE LISTED ITEMS AND NAVIGATE'),
                SizedBox (height: 80),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout'); //Button > push to location name (location name set in main)
                    },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  ),
                ),
                SizedBox (height: 80),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/history');
                  },
                  icon: Icon(
                    Icons.book,
                    color: Colors.blue,
                  ),
                ),
                SizedBox (height: 80),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/help');
                  },
                  icon: Icon(
                    Icons.help,
                    color: Colors.yellow,
                  ),
                ),
                SizedBox (height: 80),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}