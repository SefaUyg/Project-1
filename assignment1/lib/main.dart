import 'package:assignment1/homePage.dart';
import 'package:assignment1/login_page.dart';
import 'package:assignment1/sign_up.dart';
import 'package:flutter/material.dart';

import 'forgot_pass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Assignment-1",
      routes: {
        "/loginPage" : (context) => LoginPage(),
        "/signUp":(context) => SignUp(),
        "/homePage":(context) => HomePage(),
        "/forgotPassword":(context) => ForgotPassword(),
      },
      home: Scaffold(body: LoginPage(),),
    );
  }
}