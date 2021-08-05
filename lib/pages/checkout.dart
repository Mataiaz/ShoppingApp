import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('CHECKOUT          '),
        ),
      ),
        body: SafeArea(child: Text('THIS IS WERE WE WILL CHECKOUT ITEMS SELECTED')),
    );
  }
}
