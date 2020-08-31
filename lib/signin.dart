import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _firestore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN IN"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
              decoration: InputDecoration(hintText: "email"),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              }),
          TextField(
            decoration: InputDecoration(hintText: "password"),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            obscureText: true,
          ),
          FlatButton(
            child: Text("Sign in"),
            onPressed: () {
              _auth
                  .signInWithEmailAndPassword(email: email, password: password)
                  .then((firebaseUser) {
                Navigator.pushNamed(context, '/homepage');
              }).catchError((e) {
                print(e);
              });
            },
          ),
          FlatButton(
            child: Text("Sign Up"),
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
        ],
      ),
    );
  }
}
