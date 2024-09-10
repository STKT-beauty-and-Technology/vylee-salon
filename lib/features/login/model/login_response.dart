class LoginResponse {
  LoginResponse({
    required this.message,
    required this.vendorRegistrationId,
  });

  final String? message;
  final int? vendorRegistrationId;

  factory LoginResponse.fromJson(Map<String, dynamic> json){
    return LoginResponse(
      message: json["message"],
      vendorRegistrationId: json["vendorRegistrationId"],
    );
  }
}