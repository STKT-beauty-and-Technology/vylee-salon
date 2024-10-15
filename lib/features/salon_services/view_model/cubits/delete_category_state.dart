abstract class DeleteCategoryState {}

class DeleteCategoryInitialState extends DeleteCategoryState {}

class DeleteCategoryLoadingState extends DeleteCategoryState {}

class DeleteCategoryFailureState extends DeleteCategoryState {
  final String error;
  DeleteCategoryFailureState(this.error);
}

class DeleteCategorySuccessState extends DeleteCategoryState {}
