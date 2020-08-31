import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            child: Text("Log out"),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushNamed(context, '/signin');
              }).catchError((e) {
                print(e);
              });
            },
          )
        ],
      ),
    );
  }
}
