import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/model/repositories/get_bankdetails_repository.dart';

import 'get_bankdetails_state.dart';

class GetBankdetailsCubit extends Cubit<GetBankdetailsState> {
  GetBankdetailsCubit() : super(GetBankdetailsInitialState());
  final _getBankRepository = GetBankDetailsRepository();
  final logger = Logger();

  getBankDetail() async {
    try {
      final res = await _getBankRepository.getBank();
      emit(GetBankdetailsSuccessState(res));
    } catch (e) {
      emit(GetBankdetailsFailureState(e.toString()));
    }
  }
}
