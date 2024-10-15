import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/salon_services/model/delete_category_request.dart';
import 'package:vylee_partner/features/salon_services/model/delete_category_response.dart';

import '../../data/local/vendorId_provider.dart';
import '../../data/network/api_routes.dart';
import '../../data/network/api_service.dart';

class DeleteCategoryRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<DeleteCategoryResponse> deleteCategory(
      DeleteCategoryRequest request) async {
    try {
      final id = await VendorIdProvider.getVendorId();
      final response = await apiService.sendRequest.delete(
          ApiRoutes.removeCategory(request.categoryId, id),
          data: request.toJson());

      if (response.statusCode == 200) {
        return DeleteCategoryResponse.fromDioResponse(
            response.data as Map<String, dynamic>);
      } else {
        // Handle non-200 responses here if needed
        return DeleteCategoryResponse(
            message: "Error: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      logger.e(e);
      return DeleteCategoryResponse();
    } catch (e) {
      logger.e(e);
      return DeleteCategoryResponse(
          message: "Error occurred in Deleting Category $e");
    }
  }
}
