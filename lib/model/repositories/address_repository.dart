import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/data/network/api_routes.dart';
import 'package:vylee_partner/data/network/api_service.dart';
import 'package:vylee_partner/features/salon_details/model/address_request.dart';
import 'package:vylee_partner/features/salon_details/model/address_response.dart';

class AddressRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<AddressResponse> saveAddress(AddressRequest request) async {
    try {
      final response = await apiService.sendRequest
          .post(ApiRoutes.updateAddress, data: request.toJson());

      return AddressResponse.fromDioResponse(response);
    } on DioException catch (e) {
      logger.e(e);
      return AddressResponse(
          message: "Connection to Server failed", success: false);
    } catch (e) {
      logger.e(e);
      return AddressResponse(message: "Error ocurred in Address $e");
    }
  }
}
