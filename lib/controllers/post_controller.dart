import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/api_service/post_service.dart';
import 'package:pas1_mobile_11pplg2_31/model/post_model.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <PostModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}
