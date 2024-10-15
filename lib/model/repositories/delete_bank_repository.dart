import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/banking/model/delete_bank_request.dart';

import '../../data/local/vendorId_provider.dart';
import '../../data/network/api_routes.dart';
import '../../data/network/api_service.dart';
import '../../features/banking/model/delete_bank_response.dart';

class DeleteBankRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<DeleteBankResponse> deleteBank(DeleteBankRequest request) async {
    try {
      final id = await VendorIdProvider.getVendorId();
      final response = await apiService.sendRequest.delete(
          ApiRoutes.deleteBankAccount(id, request),
          data: request.toJson());

      return DeleteBankResponse.fromDioResponse(
          response as Map<String, dynamic>);
    } on DioException catch (e) {
      logger.e(e);
      return DeleteBankResponse();
    } catch (e) {
      logger.e(e);
      return DeleteBankResponse(
          message: "Error occurred in Deleting Category $e");
    }
  }
}
