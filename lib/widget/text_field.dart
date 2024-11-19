import 'package:flutter/material.dart';

class ReuseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;

  const ReuseTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFDAD4B5),
          fontSize: 16,
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
