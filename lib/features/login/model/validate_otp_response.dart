import 'package:dio/dio.dart';

class OtpResponse {
  OtpResponse({
    this.message,
    this.success,
  });

  final String? message;
  final bool? success;

  factory OtpResponse.fromDioResponse(Response res) {
    return OtpResponse(
      message: res.data,
      success: res.statusCode == 200 || res.statusCode == 201,
    );
  }
}
