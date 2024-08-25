import 'package:flutter/material.dart';
import 'package:signup/views/login_page/login_page.dart';
import 'package:signup/views/registration_page/restration_page.dart';

void main() {
  runApp(MyApp());
}

String email = '';
String password = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
