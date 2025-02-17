// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/Login_Page/login_post_controller.dart';
import 'package:pas1_mobile_11pplg2_31/controllers/user_controller.dart';
import 'package:pas1_mobile_11pplg2_31/widget/text.dart';
import 'package:pas1_mobile_11pplg2_31/widget/text_field.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E8C6),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 110),
            Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF952323),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ReuseTextField(
              hintText: 'Username',
              controller: usernameController,
            ),
            ReuseTextField(
              hintText: 'Password',
              obsecureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 16),
            Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: ReuseTextField(
                                  hintText: "Username harus diisi!",
                                  controller: usernameController,
                                ),
                                backgroundColor: Color(0xFF952323),
                              ),
                            );
                          } else {
                            await controller.login(usernameController.text,
                                passwordController.text);
                            if (controller.loginStatus.value ==
                                "Login success") {
                              Get.put(UserController())
                                  .setUsername(usernameController.text);
                              Get.snackbar(controller.loginStatus.value,
                                  controller.token.value);
                              Get.toNamed('/bottomnav');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: ReuseText(
                                    text: controller.loginStatus.value,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  backgroundColor: Color(0xFF952323),
                                ),
                              );
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isLoading.value
                        ? Color(0xFFDAD4B5)
                        : Color(0xFF952323),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                  ),
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : ReuseText(
                          text: "Login",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                )),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 200),
              child: ReuseText(
                text: "Forgot Password?",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
