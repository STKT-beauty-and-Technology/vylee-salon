// To parse this JSON data, do
//
//     final registrationResponse = registrationResponseFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vylee_partner/utilities/string.dart';

RegistrationResponse registrationResponseFromJson(String str) =>
    RegistrationResponse.fromJson(json.decode(str));

String registrationResponseToJson(RegistrationResponse data) =>
    json.encode(data.toJson());

class RegistrationResponse {
  final bool? success;
  final String? message;
  final int? status;
  final int? vendorId;
  final String? token;
  final String? tokenType;

  RegistrationResponse({
    this.success,
    this.message,
    this.status,
    this.vendorId,
    this.token,
    this.tokenType,
  });

  factory RegistrationResponse.fromDioResponse(Response response) =>
      RegistrationResponse(
          message: response.data["message"],
          status: response.statusCode,
          vendorId: response.data[Constant.vendorId],
          success: response.statusCode == 200 || response.statusCode == 201
              ? true
              : false);

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      RegistrationResponse(
        success: json["success"],
        message: json["message"],
        status: json["status"],
        vendorId: json["vendorId"],
        token: json["token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "status": status,
        "vendorId": vendorId,
        "token": token,
        "token_type": tokenType,
      };
}
