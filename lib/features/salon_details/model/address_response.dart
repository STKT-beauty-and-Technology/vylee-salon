// To parse this JSON data, do
//
//     final AddressResponse = AddressResponseFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';

AddressResponse AddressResponseFromJson(String str) =>
    AddressResponse.fromJson(json.decode(str));

String AddressResponseToJson(AddressResponse data) =>
    json.encode(data.toJson());

class AddressResponse {
  final bool? success;
  final String? message;
  final int? status;
  final String? token;
  final String? tokenType;

  AddressResponse({
    this.success,
    this.message,
    this.status,
    this.token,
    this.tokenType,
  });

  factory AddressResponse.fromDioResponse(Response response) => AddressResponse(
      message: response.statusMessage,
      status: response.statusCode,
      success: response.statusCode == 200 || response.statusCode == 201
          ? true
          : false);

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      AddressResponse(
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
