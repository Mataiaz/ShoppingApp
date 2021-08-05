import 'package:flutter/material.dart';
import 'package:shopping_app/pages/loading.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/pages/checkout.dart';
import 'package:shopping_app/help_page/help.dart';
import 'package:shopping_app/pages/history.dart';
import 'package:shopping_app/pages/settings.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/help': (context) => Help(),
    '/settings': (context) => Settings(),
    '/checkout': (context) => Checkout(),
    '/history': (context) => History(),
  },
));
