import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/salon_services/model/delete_category_request.dart';
import 'package:vylee_partner/features/salon_services/view_model/cubits/delete_category_state.dart';
import 'package:vylee_partner/model/repositories/delete_category_repository.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit() : super(DeleteCategoryInitialState());
  final _deleteCategoryRepository = DeleteCategoryRepository();
  final logger = Logger();

  removeCategory(DeleteCategoryRequest request) async {
    try {
      final res = await _deleteCategoryRepository.deleteCategory(request);
      if (res.success == true) {
        emit(DeleteCategorySuccessState());
      } else {
        emit(DeleteCategoryFailureState(res.message ?? "error"));
      }
    } catch (e) {
      emit(DeleteCategoryFailureState(e.toString()));
    }
  }
}
