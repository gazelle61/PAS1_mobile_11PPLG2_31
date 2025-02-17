// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/Login_Page/login_view.dart';
import 'package:pas1_mobile_11pplg2_31/bindings/bindings.dart';
import 'package:pas1_mobile_11pplg2_31/pages/bottom_nav.dart';
import 'package:pas1_mobile_11pplg2_31/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/splash_screen',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),
        GetPage(
            name: '/bottomnav', page: () => BottomNav(), binding: MyBindings()),
      ],
    );
  }
}
