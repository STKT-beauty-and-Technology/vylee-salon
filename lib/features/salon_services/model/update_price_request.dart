class UpdatePriceRequest {
  final String subCategoryName;
  final int price;
  final int serviceId;
  final int? subCategoryId;
  UpdatePriceRequest({
    required this.subCategoryName,
    required this.price,
    required this.serviceId,
    this.subCategoryId,
  });

  toSetPriceJson() {
    return {
      "subCategoryName": subCategoryName,
      "price": price,
      "subCategoryId": subCategoryId,
    };
  }
}
