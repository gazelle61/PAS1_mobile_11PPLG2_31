class RegisterPostModel {
  final bool status;
  final String? message;

  RegisterPostModel({
    required this.status,
    required this.message,
  });

  factory RegisterPostModel.fromJson(Map<String, dynamic> json) => RegisterPostModel(
        status: json["status"],
        message: json["message"],
      );
}
