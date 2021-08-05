import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('History          '),
        ),
      ),
      body: SafeArea (
        child: Text('THIS IS ALL YOUR ITEMS YOU HAVE CHECKED OUT (finished buying)'),
      ),
    );
  }
}
