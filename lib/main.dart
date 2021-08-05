import 'package:flutter/material.dart';
import 'package:shopping_app/pages/loading.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/pages/checkout.dart';
import 'package:shopping_app/pages/help.dart';
import 'package:shopping_app/pages/history.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/help': (context) => Help(),
    '/checkout': (context) => Checkout(),
    '/history': (context) => History(),
  },
));
