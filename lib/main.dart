import 'package:SignInAndSignUp/homepage.dart';
import 'package:SignInAndSignUp/signin.dart';
import 'package:SignInAndSignUp/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
      routes: {
        '/signup': (_) => SignUp(),
        '/homepage': (_) => HomePage(),
        '/signin': (_) => SignIn(),
      },
    );
  }
}
