import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/features/login/model/otp_request.dart';
import 'package:vylee_partner/features/login/model/validate_otp_request.dart';
import 'package:vylee_partner/features/login/view_model/cubits/otp_state.dart';
import 'package:vylee_partner/model/repositories/auth_repository.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitialState());
  final _authRepository = AuthRepository();
  final logger = Logger();

  sendOtp(OtpRequest request) async {
    emit(OtpLoadingState());
    try {
      final res = await _authRepository.sendOtp(request);
      if (res.success == true) {
        showToast(res.message ?? "OTP sent to your email");
        emit(OtpSentState());
      } else {
        emit(OtpFailureState(res.message ?? "error"));
      }
    } catch (e) {
      logger.e(e);
      emit(OtpFailureState(e.toString()));
    }
  }

  validateOtp(ValidateOtpRequest request) async {
    emit(OtpLoadingState());
    try {
      final res = await _authRepository.validateOtpAndUpdatePassword(request);
      if (res.success == true) {
        showToast(res.message ?? "Password updated");
        emit(OtpSuccessState());
      } else {
        emit(OtpFailureState(res.message ?? "error"));
      }
    } catch (e) {
      logger.e(e);
      emit(OtpFailureState(e.toString()));
    }
  }
}
