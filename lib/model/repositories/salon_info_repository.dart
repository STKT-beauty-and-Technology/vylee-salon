import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/salon_details/model/salon_info_request.dart';
import 'package:vylee_partner/features/salon_details/model/salon_info_response.dart';

import '../../data/network/api_routes.dart';
import '../../data/network/api_service.dart';

class SalonInfoRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<SalonInfoResponse> salonInfo(SalonInfoRequest request) async {
    try {
      final response = await apiService.sendRequest
          .get(ApiRoutes.salonInfo(request.vendorId, request.whatsappNumber,request.description,request.websiteName));

      return SalonInfoResponse.fromDioResponse(response);
    } on DioException catch (e) {
      logger.e(e);
      return SalonInfoResponse(message: "Connection to Server failed");
    } catch (e) {
      logger.e(e);
      return SalonInfoResponse(message: "Error ocurred in Login $e");
    }
  }
}