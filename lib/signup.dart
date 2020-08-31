import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _firestore = FirebaseFirestore.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN UP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            child: Text("Sign Up"),
            onPressed: () async {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: email, password: password)
                  .then((signedInUser) {
                _firestore.collection('users').add({
                  'email': email,
                  'password': password,
                }).then((value) {
                  if (signedInUser != null) {
                    Navigator.pushNamed(context, '/homepage');
                  }
                }).catchError((e) {
                  print(e);
                });
              }).catchError((e) {
                print(e);
              });
            },
          ),
        ],
      ),
    );
  }
}
