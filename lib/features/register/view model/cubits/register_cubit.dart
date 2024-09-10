import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/data/local/vendorId_provider.dart';
import 'package:vylee_partner/features/register/model/registration_request.dart';
import 'package:vylee_partner/features/register/view%20model/cubits/register_state.dart';
import 'package:vylee_partner/model/repositories/register_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  final _registerRepository = RegisterRepository();
  final logger = Logger();

  registerVendor(RegistrationRequest request) async {
    try {
      final res = await _registerRepository.registerVendor(request);
      print(res.message);
      if (res.success == true) {
        if (res.vendorId == null) {
          print("Already exists");
          showToast(res.message ?? "Cannot register, User already exists");
          emit(RegisterFailureState(
              res.message ?? "Cannot register, User already exists"));

          return;
        }
        logger.i("vendor id : ${res.vendorId}");
        await VendorIdProvider.saveVendorId(res.vendorId!);
        showToast("Registration Success");
        emit(RegisterSuccessState());
      } else {
        emit(RegisterFailureState(res.message ?? "error"));
      }
    } catch (e) {
      logger.e(e);
      emit(RegisterFailureState(e.toString()));
    }
  }
}
