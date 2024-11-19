// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/controllers/fav_controller.dart';
import 'package:pas1_mobile_11pplg2_31/controllers/post_controller.dart';
import 'package:pas1_mobile_11pplg2_31/model/post_model.dart';

class PostView extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  final FavController favController = Get.put(FavController());
  final PostModel post;
  bool allowDeletion = false;

  PostView({required this.post, super.key, this.allowDeletion = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(
              post.strBadge,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.strTeam,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF952323),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    post.strLocation,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFA73121),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(() {
                      var isLiked =
                          favController.getLikedById(post.idTeam).value;
                      return IconButton(
                          onPressed: () {
                            if (isLiked) {
                              if (allowDeletion) {
                                favController.deleteTask(post.idTeam);
                                Get.snackbar('Info',
                                    '${post.strTeam} removed from favorites.',
                                    backgroundColor: Color(0xFFDAD4B5),
                                    colorText: Colors.white);
                              } else {
                                Get.snackbar('Error',
                                    'You can only remove favorites from Library.',
                                    backgroundColor: Color(0xFFDAD4B5),
                                    colorText: Colors.white);
                              }
                            } else {
                              favController.addTask(post);
                              Get.snackbar(
                                  'Info', '${post.strTeam} added to favorites.',
                                  backgroundColor: Color(0xFFDAD4B5),
                                  colorText: Colors.white);
                            }
                          },
                          icon: Icon(
                            isLiked
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color:
                                isLiked ? Color(0xFF952323) : Color(0xFFA73121),
                            size: 24,
                          ));
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
