class AddCategoryRequest {
  String? categoryName;
  AddCategoryRequest({
    this.categoryName,
  });

  Map<String, dynamic> toJson() {
    return {"categoryName": categoryName};
  }
}
