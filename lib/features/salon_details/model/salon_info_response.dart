

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vylee_partner/features/salon_details/view/ui/salon_information.dart';

SalonInfoResponse SalonInfoResponseFromJson(String str) =>
    SalonInfoResponse.fromJson(json.decode(str));

String AddressResponseToJson(SalonInfoResponse data) =>
    json.encode(data.toJson());

class SalonInfoResponse {
  final bool? success;
  final String? message;
  final int? status;
  final String? token;
  final String? tokenType;

  SalonInfoResponse({
    this.success,
    this.message,
    this.status,
    this.token,
    this.tokenType,
  });

  factory SalonInfoResponse.fromDioResponse(Response response) => SalonInfoResponse(
      message: response.statusMessage,
      status: response.statusCode,
      success: response.statusCode == 200 || response.statusCode == 201
          ? true
          : false);

  factory SalonInfoResponse.fromJson(Map<String, dynamic> json) =>
      SalonInfoResponse(
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
