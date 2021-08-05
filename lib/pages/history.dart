import 'package:flutter/material.dart';
import 'package:shopping_app/custom_Widget/item.dart';

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
      body: Item(
          <String>["Item_1", "Item_2", "Hala"], <String>["20", "30", "45"]),
    );
  }
}
