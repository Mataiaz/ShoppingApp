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

  String status = "Status";

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

  void registration(String _email, String _password) async {
    try {
      auth.createUserWithEmailAndPassword(email: _email, password: _password);
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
            Text(status),
            TextField(
              controller: myControllerEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "email",
                //prefixText: "barry.allen@example.com"
              ),
            ),
            TextField(
              controller: myControllerPass,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                //prefixText: "SuperSecretPassword!"
              ),
            ),
            Column(
              children: [
                RaisedButton(
                    onPressed:
                        // "barry.allen@example.com"
                        // "SuperSecretPassword!"
                        // myControllerEmail.text == "" ||
                        //         myControllerPass.text == ""
                        //     ? null:
                        () {
                      signIn(myControllerEmail.text.toString(),
                          myControllerPass.text.toString());
                    },
                    child: Text("Log in")),
                RaisedButton(
                    onPressed:
                        // myControllerEmail.text == "" ||
                        //         myControllerPass.text == ""
                        //     ? null:
                        () {
                      registration(myControllerEmail.text.toString(),
                          myControllerPass.text.toString());
                    },
                    child: Text("Registration")),
                RaisedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text("Log Out")),
                RaisedButton(
                    onPressed: () {
                      FirebaseAuth.instance.authStateChanges().listen((auth) {
                        if (auth == null) {
                          status = 'User is currently signed out!';
                        } else {
                          status = 'User is signed in!';
                        }
                        setState(() {});
                      });
                    },
                    child: Text("Status")),
              ],
            ),
          ],
        ));
  }
}
