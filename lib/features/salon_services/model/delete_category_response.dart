class DeleteCategoryResponse {
  bool? success;
  String? message;
  int? vendorId;
  String? categoryName;
  int? categoryId;

  DeleteCategoryResponse(
      {this.message,
      this.vendorId,
      this.categoryName,
      this.categoryId,
      this.success});
  factory DeleteCategoryResponse.fromDioResponse(
          Map<String, dynamic> response) =>
      DeleteCategoryResponse(
        success: response['success'],
        message: response['message'],
        vendorId: response['vendorId'],
        categoryName: response['categoryName'],
        categoryId: response['categoryId'],
      );
  DeleteCategoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    vendorId = json['vendorId'];
    categoryName = json['categoryName'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    data['vendorId'] = this.vendorId;
    data['categoryName'] = this.categoryName;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
