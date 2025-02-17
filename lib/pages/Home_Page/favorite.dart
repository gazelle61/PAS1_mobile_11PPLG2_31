// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/controllers/fav_controller.dart';
import 'package:pas1_mobile_11pplg2_31/pages/post_view.dart';

class Favorite extends StatelessWidget {
  final FavController favController = Get.put(FavController());

  Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFF2E8C6),
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Color(0xFF952323),
        centerTitle: true,
      ),
      body: Obx(() {
        if (favController.tasks.isEmpty) {
          return Center(
            child: Text('tidak ada liga yang disukai',
                style: TextStyle(color: Colors.white)),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: favController.tasks.length,
          itemBuilder: (context, index) {
            final dataSoccer = favController.tasks[index];
            return PostView(
              post: dataSoccer,
              allowDeletion: true,
            );
          },
        );
      }),
    );
  }
}
