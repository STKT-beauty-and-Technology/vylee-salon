import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/data/network/api_routes.dart';
import 'package:vylee_partner/data/network/api_service.dart';
import 'package:vylee_partner/features/login/model/login_request.dart';
import 'package:vylee_partner/features/login/model/login_response.dart';
import 'package:vylee_partner/features/login/model/otp_request.dart';
import 'package:vylee_partner/features/login/model/otp_response.dart';
import 'package:vylee_partner/features/login/model/validate_otp_request.dart';

class AuthRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<LoginResponse> loginVendor(LoginRequest request) async {
    try {
      final response = await apiService.sendRequest
          .get(ApiRoutes.vendorLogin(request.email, request.password));

      return LoginResponse.fromDioResponse(response);
    } on DioException catch (e) {
      logger.e(e);
      return LoginResponse(message: "Connection to Server failed");
    } catch (e) {
      logger.e(e);
      return LoginResponse(message: "Error ocurred in Login $e");
    }
  }

  Future<OtpResponse> sendOtp(OtpRequest request) async {
    try {
      final response =
          await apiService.sendRequest.post(ApiRoutes.sendOtp(request.email));
      logger.i(response);
      return OtpResponse.fromDioResponse(response);
    } on DioException catch (e) {
      logger.e(e);
      return OtpResponse(
          message: "Connection to Server failed, Request OTP again");
    } catch (e) {
      logger.e(e);
      return OtpResponse(message: "Error ocurred in Sending OTP $e");
    }
  }

  Future<OtpResponse> validateOtpAndUpdatePassword(
      ValidateOtpRequest request) async {
    try {
      final response = await apiService.sendRequest.post(
          ApiRoutes.validateOtp(request.email, request.otp, request.password));
      logger.i(response);
      return OtpResponse.fromDioResponse(response);
    } on DioException catch (e) {
      logger.e(e);
      return OtpResponse(message: "Connection to Server failed, Try Again");
    } catch (e) {
      logger.e(e);
      return OtpResponse(message: "Error ocurred in Validating $e");
    }
  }
}
