import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/controllers/bottom_nav_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
  }
}