import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/features/salon_services/model/add_category_request.dart';
import 'package:vylee_partner/features/salon_services/model/add_service_request.dart';
import 'package:vylee_partner/features/salon_services/model/update_price_request.dart';
import 'package:vylee_partner/features/salon_services/view_model/cubits/service_category_state.dart';
import 'package:vylee_partner/model/repositories/services_repository.dart';

class ServiceCategoryCubit extends Cubit<ServiceCategoryState> {
  ServiceCategoryCubit() : super(ServiceCategoryInitialState());
  final _serviceRepository = ServicesRepository();
  final logger = Logger();

  getAllCategories() async {
    emit(ServiceCategoryLoadingState());
    try {
      final res = await _serviceRepository.getAllCategories();
      emit(ServiceCategorySuccessState(res));
    } catch (e) {
      logger.e(e);
      emit(ServiceCategoryFailureState(e.toString()));
    }
  }

  addCategory(AddCategoryRequest req) async {
    emit(ServiceCategoryLoadingState());
    try {
      final res = await _serviceRepository.addCategory(req);
      showToast(res.message ?? "added service");
      await getAllCategories();
    } catch (e) {
      logger.e(e);
      emit(ServiceCategoryFailureState(e.toString()));
    }
  }

  // addService(AddServiceRequest req) async {
  //   emit(ServiceCategoryLoadingState());
  //   try {
  //     await _serviceRepository.addService(req);
  //     showToast("added Service");
  //   } catch (e) {
  //     logger.e(e);
  //     emit(ServiceCategoryFailureState(e.toString()));
  //   }
  // }
  addService(AddServiceRequest req) async {
    try {
      final res2 = await _serviceRepository.addService(req);
      if (res2 != null && res2.success == true) {
        emit(ServiceCategorySuccessState(res2));
      } else {
        emit(ServiceCategoryFailureState(res2.message ?? "error"));
      }
    } catch (e) {
      emit(ServiceCategoryFailureState(e.toString()));
    }
  }

  updatePrice(UpdatePriceRequest req) async {
    try {
      await _serviceRepository.updatePrice(req);
      showToast("updated price");
    } catch (e) {
      logger.e(e);
      emit(ServiceCategoryFailureState(e.toString()));
    }
  }
}
