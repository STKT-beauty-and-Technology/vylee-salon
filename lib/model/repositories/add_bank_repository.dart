import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/banking/model/add_bankAccount_request.dart';

import '../../data/local/vendorId_provider.dart';
import '../../data/network/api_routes.dart';
import '../../data/network/api_service.dart';
import '../../features/banking/model/add_bankAccount_response.dart';

class AddBankRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<AddBankaccountResponse> addBank(AddBankAccountRequest request) async {
    try {
      final id = await VendorIdProvider.getVendorId();
      final response = await apiService.sendRequest
          .post(ApiRoutes.addBankAccount(id), data: request.toJson());

      return AddBankaccountResponse.fromDioResponse(response);
    } on DioException catch (e) {
      logger.e(e);
      return AddBankaccountResponse(
          message: "Connection to Server failed", success: false);
    } catch (e) {
      logger.e(e);
      return AddBankaccountResponse(message: "Error ocurred in Address $e");
    }
  }
}
