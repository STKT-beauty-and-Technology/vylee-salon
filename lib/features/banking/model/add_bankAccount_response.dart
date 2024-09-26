import 'dart:convert';

import 'package:dio/dio.dart';

AddBankaccountResponse AddressResponseFromJson(String str) =>
    AddBankaccountResponse.fromJson(json.decode(str));

String AddressResponseToJson(AddBankaccountResponse data) =>
    json.encode(data.toJson());

class AddBankaccountResponse {
  final bool? success;
  final String? message;
  final int? status;
  final String? token;
  final String? tokenType;

  AddBankaccountResponse({
    this.success,
    this.message,
    this.status,
    this.token,
    this.tokenType,
  });

  factory AddBankaccountResponse.fromDioResponse(Response response) =>
      AddBankaccountResponse(
          message: response.statusMessage,
          status: response.statusCode,
          success: response.statusCode == 200 || response.statusCode == 201
              ? true
              : false);

  factory AddBankaccountResponse.fromJson(Map<String, dynamic> json) =>
      AddBankaccountResponse(
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
