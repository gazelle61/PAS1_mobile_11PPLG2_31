// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/controllers/bottom_nav_controller.dart';
import 'package:pas1_mobile_11pplg2_31/pages/Home_Page/favorite.dart';
import 'package:pas1_mobile_11pplg2_31/pages/Home_Page/home.dart';
import 'package:pas1_mobile_11pplg2_31/pages/Home_Page/profile.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.put(BottomNavController());

    final List<Widget> menus = [
      Home(),
      Favorite(),
      Profile(),
    ];

    return Obx(() {
      return Scaffold(
        body: menus[bottomNavController.selectedIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color(0xFF952323),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: Color(0xFF952323),
              selectedItemColor: Color(0xFFDAD4B5),
              unselectedItemColor: const Color(0xFFF2E8C6),
              currentIndex: bottomNavController.selectedIndex.value,
              onTap: bottomNavController.changeMenu,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
