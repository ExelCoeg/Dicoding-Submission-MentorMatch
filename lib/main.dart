import 'package:flutter/material.dart';
import 'package:mentormatchclone/login_page.dart';
import 'package:mentormatchclone/home_page.dart';
import 'package:mentormatchclone/main_page.dart';
import 'package:mentormatchclone/mentors_page.dart';

const Color primaryColor = Color.fromRGBO(113, 111, 244, 1.0);
const Color onBackgroundColor = Color.fromRGBO(246, 246, 246, 1.0);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      title: 'Flutter Demo',
      home: const LoginPage(),
    );
  }
}

