import 'package:flutter/material.dart';
import 'HomePage/homePage.dart';
import 'src/LoginPage.dart';

void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':  (context) => const SignUpScreen(),
        '/tabBar': (context) => MyHomePage(),
      },
    );
  }
}


