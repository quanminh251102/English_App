import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:super_english_app/page/User/login_page.dart';
import 'package:super_english_app/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Timer(const Duration(seconds: 2), (() => Get.to(LoginPage())));
    return Scaffold(
      backgroundColor: MyColor.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.amber,
                height: screenSize.height * 0.3,
                width: screenSize.width * 0.5,
                child: Image.asset('assets/images/college.png')),
            ],
          )
      ]),
    );
  }
}