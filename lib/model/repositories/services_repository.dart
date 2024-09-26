import 'package:logger/logger.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/data/local/vendorId_provider.dart';
import 'package:vylee_partner/data/network/api_routes.dart';
import 'package:vylee_partner/data/network/api_service.dart';
import 'package:vylee_partner/features/salon_services/model/add_category_request.dart';
import 'package:vylee_partner/features/salon_services/model/add_service_request.dart';
import 'package:vylee_partner/features/salon_services/model/category_data_response.dart';
import 'package:vylee_partner/features/salon_services/model/get_categories_response.dart';
import 'package:vylee_partner/features/salon_services/model/update_price_request.dart';

class ServicesRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<List<GetCategoriesResponse>> getAllCategories() async {
    try {
      final id = await VendorIdProvider.getVendorId();
      final response =
          await apiService.sendRequest.get(ApiRoutes.getAllCategories(id));
      List<GetCategoriesResponse> categories = [];

      for (var data in response.data) {
        final category = GetCategoriesResponse.fromDioResponse(data);
        final categoryData = await getCategoryData(category);
        if (categoryData?.serviceProducts != null) {
          category.categoryData = categoryData;
        }
        categories.add(category);
      }

      return categories.reversed.toList();
    } catch (e) {
      logger.e(e);
      showToast(e.toString());
      return [];
    }
  }

  Future<CategoryData?> getCategoryData(GetCategoriesResponse category) async {
    try {
      final id = await VendorIdProvider.getVendorId();
      final response = await apiService.sendRequest
          .get(ApiRoutes.getCategoryData(category.categoryName, id));

      final categoryData = CategoryData.fromJson(response.data);
      return categoryData;
    } catch (e) {
      logger.e(e);
      showToast(e.toString());
    }
    return null;
  }

  Future<GetCategoriesResponse> addCategory(AddCategoryRequest request) async {
    try {
      final id = await VendorIdProvider.getVendorId();
      final response = await apiService.sendRequest
          .post(ApiRoutes.addCategory(id), data: request.toJson());
      return GetCategoriesResponse(message: response.data);
    } catch (e) {
      logger.e(e);
      showToast("Category Added");
      return GetCategoriesResponse(message: e.toString());
    }
  }

  addService(AddServiceRequest request) async {
    final id = await VendorIdProvider.getVendorId();
    int? serviceId = request.serviceId;
    if (serviceId == null) {
      try {
        final res1 = await apiService.sendRequest.post(
            ApiRoutes.addServiceToCategory(request.categoryId, id),
            data: request.toAddServiceJson());
        request.serviceId = serviceId ?? res1.data["serviceProductId"];
      } catch (e) {
        // logger.e(e);
        showToast("error in saving service");
      }
    }

    try {
      logger.e(request.toAddSubCategoryJson());
      final res2 = await apiService.sendRequest.post(
          ApiRoutes.addSubCategoryToService(request.serviceId, id),
          data: request.toAddSubCategoryJson());
    } catch (e) {
      logger.e(e);
      showToast("error in saving sub category");
    }
  }

  updatePrice(UpdatePriceRequest request) async {
    try {
      final id = await VendorIdProvider.getVendorId();

      final res = await apiService.sendRequest.post(
          ApiRoutes.addSubCategoryToService(request.serviceId, id),
          data: request.toSetPriceJson());
    } catch (e) {
      logger.e(e);
      showToast(e.toString());
    }
  }
}
