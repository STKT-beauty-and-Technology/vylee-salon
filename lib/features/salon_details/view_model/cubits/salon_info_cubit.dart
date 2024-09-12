import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/salon_details/model/salon_info_request.dart';
import 'package:vylee_partner/features/salon_details/view_model/cubits/salon_info_state.dart';
import 'package:vylee_partner/model/repositories/salon_info_repository.dart';

class SalonInfoCubit extends Cubit<SalonInfoState> {
  SalonInfoCubit() : super(SalonInfoInitialState());
  final _salonInfoRespository = SalonInfoRepository();
  final logger = Logger();

  salonInfo(SalonInfoRequest request) async {
    emit(SalonInfoLoadingState());
    try {
      final res = await _salonInfoRespository.salonInfo(request);
      if (res.success == true) {
        emit(SalonInfoSuccessState());
      } else {
        emit(SalonInfoFailureState(res.message ?? "error"));
      }
    } catch (e) {
      emit(SalonInfoFailureState(e.toString()));
    }
  }
}