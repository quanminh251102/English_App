import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:super_english_app/page/signup_page.dart';
import 'package:super_english_app/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

