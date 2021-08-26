import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/loading.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/pages/checkout.dart';
import 'package:shopping_app/help_page/help.dart';
import 'package:shopping_app/pages/history.dart';
import 'package:shopping_app/pages/settings.dart';
import 'package:shopping_app/pages/log_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/help': (context) => Help(),
      '/settings': (context) => SettingsPhone(),
      '/checkout': (context) => Checkout(),
      '/history': (context) => History(),
      '/log_inn': (context) => LogIn(),
    },
  ));
}
