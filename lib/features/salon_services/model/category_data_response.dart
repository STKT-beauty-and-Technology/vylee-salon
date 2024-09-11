// To parse this JSON data, do
//
//     final categoryData = categoryDataFromJson(jsonString);

import 'dart:convert';

CategoryData categoryDataFromJson(String str) =>
    CategoryData.fromJson(json.decode(str));

String categoryDataToJson(CategoryData data) => json.encode(data.toJson());

class CategoryData {
  final String? message;
  final List<ServiceProduct>? serviceProducts;

  CategoryData({
    this.message,
    this.serviceProducts,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        message: json["message"],
        serviceProducts: json["serviceProducts"] == null
            ? []
            : List<ServiceProduct>.from(json["serviceProducts"]!
                .map((x) => ServiceProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "serviceProducts": serviceProducts == null
            ? []
            : List<dynamic>.from(serviceProducts!.map((x) => x.toJson())),
      };
}

class ServiceProduct {
  final int? serviceId;
  final String? serviceName;
  final int? vendorId;
  final ServiceCategory? serviceCategory;
  final List<SubCategory>? subCategories;

  ServiceProduct({
    this.serviceId,
    this.serviceName,
    this.vendorId,
    this.serviceCategory,
    this.subCategories,
  });

  factory ServiceProduct.fromJson(Map<String, dynamic> json) => ServiceProduct(
        serviceId: json["serviceId"],
        serviceName: json["serviceName"],
        vendorId: json["vendorId"],
        serviceCategory: json["serviceCategory"] == null
            ? null
            : ServiceCategory.fromJson(json["serviceCategory"]),
        subCategories: json["subCategories"] == null
            ? []
            : List<SubCategory>.from(
                json["subCategories"]!.map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "serviceName": serviceName,
        "vendorId": vendorId,
        "serviceCategory": serviceCategory?.toJson(),
        "subCategories": subCategories == null
            ? []
            : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

class ServiceCategory {
  final int? categoryId;
  final String? categoryName;
  final int? vendorId;

  ServiceCategory({
    this.categoryId,
    this.categoryName,
    this.vendorId,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      ServiceCategory(
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        vendorId: json["vendorId"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "vendorId": vendorId,
      };
}

class SubCategory {
  final int? subCategoryId;
  final String? subCategoryName;
  final int? subCategoryPrice;

  SubCategory({
    this.subCategoryId,
    this.subCategoryName,
    this.subCategoryPrice,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        subCategoryId: json["subCategoryId"],
        subCategoryName: json["subCategoryName"],
        subCategoryPrice: json["subCategoryPrice"],
      );

  Map<String, dynamic> toJson() => {
        "subCategoryId": subCategoryId,
        "subCategoryName": subCategoryName,
        "subCategoryPrice": subCategoryPrice,
      };
}
