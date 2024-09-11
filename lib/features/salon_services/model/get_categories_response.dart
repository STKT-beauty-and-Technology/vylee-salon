import 'package:vylee_partner/features/salon_services/model/category_data_response.dart';

class GetCategoriesResponse {
  GetCategoriesResponse({
    this.message,
    this.vendorId,
    this.categoryId,
    this.categoryName,
    this.success,
    this.categoryData,
  });

  final String? message;
  final String? categoryName;
  final int? vendorId;
  final int? categoryId;
  final bool? success;
  CategoryData? categoryData;

  factory GetCategoriesResponse.fromDioResponse(Map<String, dynamic> data) {
    return GetCategoriesResponse(
        vendorId: data["vendorId"],
        categoryName: data["categoryName"],
        categoryId: data["categoryId"]);
  }
}
