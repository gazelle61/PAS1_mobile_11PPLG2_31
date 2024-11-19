import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_31/api/postmodel.dart';

class RegisterApiService {
  final url = Uri.parse('https://mediadwi.com/api/latihan/register-user');
  Future<RegisterPostModel> registerUser(
      String username, String password, String fullName, String email) async {
    try {
      final response = await http
          .post(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      }, body: <String, String>{
        'username': username,
        'password': password,
        'email': email,
        'full_name': fullName
      });

      if (response.statusCode == 200) {
        return RegisterPostModel.fromJson(json.decode(response.body));
      } else {
        return RegisterPostModel(status: false, message: 'Server error.');
      }
    } catch (e) {
      return RegisterPostModel(status: false, message: 'An error occurred: $e');
    }
  }
}