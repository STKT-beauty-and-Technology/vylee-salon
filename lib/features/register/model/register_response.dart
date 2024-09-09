// To parse this JSON data, do
//
//     final registrationResponse = registrationResponseFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';

RegistrationResponse registrationResponseFromJson(String str) =>
    RegistrationResponse.fromJson(json.decode(str));

String registrationResponseToJson(RegistrationResponse data) =>
    json.encode(data.toJson());

class RegistrationResponse {
  final bool? success;
  final String? message;
  final int? status;
  final String? token;
  final String? tokenType;

  RegistrationResponse({
    this.success,
    this.message,
    this.status,
    this.token,
    this.tokenType,
  });

  factory RegistrationResponse.fromDioResponse(Response response) =>
      RegistrationResponse(
          message: response.statusMessage,
          status: response.statusCode,
          success: response.statusCode == 200 || response.statusCode == 201
              ? true
              : false);

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      RegistrationResponse(
        success: json["success"],
        message: json["message"],
        status: json["status"],
        token: json["token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "status": status,
        "token": token,
        "token_type": tokenType,
      };
}
