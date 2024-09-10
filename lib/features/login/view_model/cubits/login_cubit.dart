import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/data/local/vendorId_provider.dart';
import 'package:vylee_partner/features/login/model/login_request.dart';
import 'package:vylee_partner/features/login/model/otp_request.dart';
import 'package:vylee_partner/features/login/view_model/cubits/login_state.dart';
import 'package:vylee_partner/model/repositories/auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  final _authRepository = AuthRepository();
  final logger = Logger();

  loginVendor(LoginRequest request) async {
    emit(LoginLoadingState());
    try {
      final res = await _authRepository.loginVendor(request);
      if (res.success == true) {
        if (res.vendorRegistrationId == null) {
          showToast(res.message ?? "");
          emit(LoginFailureState(
              res.message ?? "Cannot Login, User is not registered"));

          return;
        }
        await VendorIdProvider.saveVendorId(res.vendorRegistrationId!);
        showToast(res.message ?? "Login Success");
        emit(LoginSuccessState());
      } else {
        emit(LoginFailureState(res.message ?? "error"));
      }
    } catch (e) {
      logger.e(e);
      emit(LoginFailureState(e.toString()));
    }
  }

  sendOtp(OtpRequest request) async {
    emit(LoginInitialState());
    try {
      final res = await _authRepository.sendOtp(request);
      if (res.success == true) {
        showToast(res.message ?? "OTP sent to your email");
        emit(LoginSuccessState());
      } else {
        emit(LoginFailureState(res.message ?? "error"));
      }
    } catch (e) {
      logger.e(e);
      emit(LoginFailureState(e.toString()));
    }
  }
}
