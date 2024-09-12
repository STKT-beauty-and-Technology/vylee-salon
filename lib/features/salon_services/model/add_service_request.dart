class AddServiceRequest {
  final String serviceName;
  final int categoryId;
  final String subCategoryName;
  final int price;
  int? serviceId;
  AddServiceRequest({
    required this.serviceName,
    required this.categoryId,
    required this.subCategoryName,
    required this.price,
    this.serviceId,
  });

  toAddServiceJson() {
    return {
      "serviceName": serviceName,
      "serviceId": serviceId,
    };
  }

  toAddSubCategoryJson() {
    return {
      "subCategoryName": subCategoryName,
      "price": price,
    };
  }
}
