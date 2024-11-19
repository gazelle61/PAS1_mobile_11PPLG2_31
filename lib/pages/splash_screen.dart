// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/Login_Page/login_view.dart';
import 'package:pas1_mobile_11pplg2_31/widget/text.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Get.off(() => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF952323),
      body: Container(
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReuseText(
              text: 'English League',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFDAD4B5),
            ),
          ],
        ),
      ),
    );
  }
}
