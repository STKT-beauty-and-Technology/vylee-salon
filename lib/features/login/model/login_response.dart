import 'package:dio/dio.dart';
import 'package:vylee_partner/utilities/string.dart';

class LoginResponse {
  LoginResponse({
    this.message,
    this.vendorRegistrationId,
    this.success,
  });

  final String? message;
  final int? vendorRegistrationId;
  final bool? success;

  factory LoginResponse.fromDioResponse(Response res) {
    return LoginResponse(
      message: res.data["message"],
      vendorRegistrationId: res.data[Constant.vendorId],
      success: res.statusCode == 200 || res.statusCode == 201,
    );
  }
}
