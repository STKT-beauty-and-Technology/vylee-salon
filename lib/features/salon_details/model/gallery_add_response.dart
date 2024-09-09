// To parse this JSON data, do
//
//     final GalleryAddResponse = GalleryAddResponseFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';

GalleryAddResponse GalleryAddResponseFromJson(String str) =>
    GalleryAddResponse.fromJson(json.decode(str));

String GalleryAddResponseToJson(GalleryAddResponse data) =>
    json.encode(data.toJson());

class GalleryAddResponse {
  final bool? success;
  final String? message;
  final int? status;
  final String? token;
  final String? tokenType;

  GalleryAddResponse({
    this.success,
    this.message,
    this.status,
    this.token,
    this.tokenType,
  });

  factory GalleryAddResponse.fromDioResponse(Response response) =>
      GalleryAddResponse(
          message: response.statusMessage,
          status: response.statusCode,
          success: response.statusCode == 200 || response.statusCode == 201
              ? true
              : false);

  factory GalleryAddResponse.fromJson(Map<String, dynamic> json) =>
      GalleryAddResponse(
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
