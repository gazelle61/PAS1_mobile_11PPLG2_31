// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double topPadding;
  final double borderRadius;
  final Color backgroundColor;

  const CircularContainer({
    super.key,
    required this.child,
    this.height = 620.0,
    this.topPadding = 80.0,
    this.borderRadius = 30.0,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
          color: backgroundColor,
        ),
        height: height,
        width: double.infinity,
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: child,
        ),
      ),
    );
  }
}
