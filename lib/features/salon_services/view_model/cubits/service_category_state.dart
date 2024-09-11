import 'package:vylee_partner/features/salon_services/model/get_categories_response.dart';

abstract class ServiceCategoryState {}

class ServiceCategoryInitialState extends ServiceCategoryState {}

class ServiceCategoryLoadingState extends ServiceCategoryState {}

class ServiceCategoryFailureState extends ServiceCategoryState {
  final String error;
  ServiceCategoryFailureState(this.error);
}

class ServiceCategorySuccessState extends ServiceCategoryState {
  final List<GetCategoriesResponse> categories;
  ServiceCategorySuccessState(this.categories);
}
