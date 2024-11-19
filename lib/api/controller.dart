
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_31/api/service.dart';

class RegisterController extends GetxController {
  final RegisterApiService registerService = RegisterApiService();

  var isLoading = false.obs;
  var message = ''.obs;

  Future<bool> registerUser(String username, String password, String fullName, String email) async {
    isLoading.value = true;
    message.value = '';

    final response = await registerService.registerUser(username, password, fullName, email);

    if (response.status == true) {
      message.value = response.message ?? 'Account Created Successfully';
    } else {
      message.value = response.message ?? 'Failed to create account';
    }

    isLoading.value = false;
    return response.status;
  }
}
