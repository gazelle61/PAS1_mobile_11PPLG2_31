// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/Login_Page/login_post_controller.dart';
import 'package:pas1_mobile_11pplg2_31/api/controller.dart';
import 'package:pas1_mobile_11pplg2_31/controllers/user_controller.dart';
import 'package:pas1_mobile_11pplg2_31/widget/text.dart';
import 'package:pas1_mobile_11pplg2_31/widget/text_field.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E8C6),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.sports_soccer,
                    size: 80,
                    color: Color(0xFF952323),
                  ),
                  SizedBox(height: 10),
                  ReuseText(
                    text: 'Welcome',
                    fontSize: 18,
                    color: Color(0xFF952323),
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            // Username Field
            ReuseTextField(
              hintText: 'Username',
              controller: usernameController,
            ),
            SizedBox(height: 16),

            ReuseTextField(
              hintText: 'Password',
              obsecureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 24),

            // Login Button
            Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA73121),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: loginController.isLoading.value
                    ? null
                    : () async {
                        if (usernameController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: ReuseText(
                                text: "Nama dan password harus diisi!",
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              backgroundColor: Color(0xFF952323),
                            ),
                          );
                        } else {
                          await loginController.login(
                              usernameController.text, passwordController.text);
                          if (loginController.loginStatus.value ==
                              "Berhasil masuk") {
                            Get.put(RegisterController());
                            Get.put(UserController())
                                .setUsername(usernameController.text);
                            Get.snackbar(
                              "Berhasil Login",
                              "Selamat datang!",
                              backgroundColor: Color(0xFFDAD4B5),
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(seconds: 2),
                            );
                            Get.toNamed('/bottom_nav');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: ReuseText(
                                  text: loginController.loginStatus.value,
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                                backgroundColor: Color(0xFF952323),
                              ),
                            );
                          }
                        }
                      },
                child: loginController.isLoading.value
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : ReuseText(
                        text: "Login",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF2E8C6),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
