class DeleteBankResponse {
  bool? success;
  String? message;
  int? vendorId;
  String? categoryName;
  int? categoryId;

  DeleteBankResponse(
      {this.message,
      this.vendorId,
      this.categoryName,
      this.categoryId,
      this.success});
  factory DeleteBankResponse.fromDioResponse(Map<String, dynamic> response) =>
      DeleteBankResponse(
        success: response['success'],
        message: response['message'],
        vendorId: response['vendorId'],
        categoryName: response['categoryName'],
        categoryId: response['categoryId'],
      );
  DeleteBankResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    vendorId = json['vendorId'];
    categoryName = json['categoryName'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['vendorId'] = this.vendorId;
    data['categoryName'] = this.categoryName;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
