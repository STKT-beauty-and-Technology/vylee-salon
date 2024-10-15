class DeleteCategoryRequest {
  final int categoryId;

  DeleteCategoryRequest({required this.categoryId});

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
      };
}
