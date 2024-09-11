import 'dart:math';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/data/network/api_routes.dart';
import 'package:vylee_partner/data/network/api_service.dart';
import 'package:vylee_partner/features/register/model/registration_request.dart';
import 'package:vylee_partner/features/register/model/register_response.dart';
import 'package:vylee_partner/utilities/string.dart';

class RegisterRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<RegistrationResponse> registerVendor(
      RegistrationRequest request) async {
    try {
      final response = await apiService.sendRequest
          .post(ApiRoutes.register, data: request.toJson());

      return RegistrationResponse.fromDioResponse(response);
    } on DioException catch (e) {
      logger.e(e);
      return RegistrationResponse(
          message: "Connection to Server failed", success: false);
    } catch (e) {
      logger.e(e);
      return RegistrationResponse(message: "Error ocurred in Registration $e");
    }
  }
}
