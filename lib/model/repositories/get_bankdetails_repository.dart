import 'dart:core';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/banking/model/get_bankdetails_response.dart';

import '../../data/local/vendorId_provider.dart';
import '../../data/network/api_routes.dart';
import '../../data/network/api_service.dart';

class GetBankDetailsRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<List<GetBankDetailsResponse>> getBank() async {
    try {
      final id = await VendorIdProvider.getVendorId();
      final response =
          await apiService.sendRequest.get(ApiRoutes.getBankDetails(id));
      List<GetBankDetailsResponse> bankDetails = [];

      for (var data in response.data) {
        final bankDetail = GetBankDetailsResponse.fromDioResponse(data);
        bankDetails.add(bankDetail);
      }
      return bankDetails;
    } on DioException catch (e) {
      logger.e(e);
      return [];
    } catch (e) {
      logger.e(e);
      return [];
    }
  }
}
