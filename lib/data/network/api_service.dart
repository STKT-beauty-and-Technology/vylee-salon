import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vylee_partner/data/local/vendorId_provider.dart';
import 'package:vylee_partner/data/network/api_routes.dart';
import 'package:vylee_partner/utilities/string.dart';

class ApiService {
  final Dio _dio = Dio();
  final _logger = Logger();

  ApiService._privateConstructor() {
    initApiService();
  }

  static final ApiService _instance = ApiService._privateConstructor();

  factory ApiService() {
    return _instance;
  }

  initApiService() {
    _dio.options.baseUrl = ApiRoutes.devUrl;
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.interceptors
      ..add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          // String? token = await JwtProvider.getJwt();

          // if (token != null) {
          //   log('token $token');
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
          if ((!options.path.toLowerCase().contains("otp") &&
                  !options.path.contains("login") &&
                  !options.path.contains("services") &&
                  !options.path.contains("gallery") &&
                  !options.path.contains("registration")) &&
              options.method.toLowerCase() != "get") {
            int? vendorId = await VendorIdProvider.getVendorId();
            options.data["vendorId"] = vendorId;
            _logger.i(
                " request Path: ${options.path} /n  Request data : ${options.data}");
            return handler.next(options);
          }
          _logger.i(
              " request Path: ${options.path} /n  Request data : ${options.data}");
 
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.i("Response : ${response.data}");
          return handler.resolve(response);
        },
      ))
      ..add(PrettyDioLogger(
          request: true,
          error: true,
          requestBody: true,
          requestHeader: false,
          responseHeader: false,
          responseBody: true,
          logPrint: (Object object) {
            // if (object.toString().contains('uri') ||
            //     object.toString().contains('message')) {
            //   if (kDebugMode) {
            //     log(object.toString());
            //   }
            // }
          }));
  }

  Dio get sendRequest => _dio;
}
