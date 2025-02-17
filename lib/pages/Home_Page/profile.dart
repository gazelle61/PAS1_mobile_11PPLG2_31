// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/controllers/user_controller.dart';
import 'package:pas1_mobile_11pplg2_31/widget/cicular_container.dart';
import 'package:pas1_mobile_11pplg2_31/widget/text.dart';

class Profile extends StatelessWidget {
  final UserController userController = UserController();

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF952323),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 20,
                    child: ReuseText(
                      text: 'Profile',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFDAD4B5),
                    ),
                  ),
                  CircularContainer(
                    backgroundColor: const Color(0xFFF2E8C6),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFDAD4B5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Color(0xFFA73121),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() {
                                      return Text(
                                        "Hi, ${userController.username.value}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFA73121),
                                        ),
                                      );
                                    }),
                                    ReuseText(
                                      text: '6285691095363',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xFFA73121),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Color(0xFFA73121),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          ListTile(
                            leading:
                                Icon(Icons.logout, color: Color(0xFF952323)),
                            title: Text("Log Out",
                                style: TextStyle(
                                    color: Color(0xFF952323), fontSize: 18)),
                            trailing: Icon(Icons.arrow_forward_ios,
                                color: Color(0xFFA73121)),
                            onTap: () {
                              Get.toNamed('/');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
