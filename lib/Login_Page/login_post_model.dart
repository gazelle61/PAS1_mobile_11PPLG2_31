class LoginPostModel {
  final bool status;
  final String message;
  final String? token;

  LoginPostModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory LoginPostModel.fromJson(Map<String, dynamic> json) => LoginPostModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
      );
}
