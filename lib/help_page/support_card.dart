import 'support.dart';
import 'package:flutter/material.dart';


class SupportCard extends StatelessWidget {

  final Support support;
  SupportCard({ required this.support });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[500],
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              support.tried,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              support.support,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.red[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
