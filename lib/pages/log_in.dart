import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential userCredential;

  var myControllerEmail = TextEditingController();
  var myControllerPass = TextEditingController();

  void initState() {
    super.initState();
    firebaseAuthSub();
  }

  void firebaseAuthSub() {
    FirebaseAuth.instance.authStateChanges().listen((auth) {
      if (auth == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  void signInAnon() async {
    userCredential = await FirebaseAuth.instance.signInAnonymously();
  }

  void registration() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void signIn(String _email, String _password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              // email: "barry.allen@example.com",
              // password: "SuperSecretPassword!");
              email: _email,
              password: _password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('LogIn          '),
          ),
        ),
        body: Column(
          children: [
            Text("Status: "),
            TextField(
              controller: myControllerEmail,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "email"),
            ),
            TextField(
              controller: myControllerPass,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
            RaisedButton(onPressed: null, child: Text("Log in")),
          ],
        ));
  }
}
