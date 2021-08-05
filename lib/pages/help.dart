import 'package:flutter/material.dart';

class Help extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('SUPPORT          ')),
      ),
    body: SafeArea(
    child: Text('THIS IS WERE WE HAVE PHONE NUMBER/EMAIL/SUPPORT')),
    );
  }
}
