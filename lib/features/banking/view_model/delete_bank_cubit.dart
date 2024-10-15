import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/banking/view_model/delete_bank_state.dart';
import 'package:vylee_partner/model/repositories/delete_bank_repository.dart';

import '../model/delete_bank_request.dart';

class DeleteBankCubit extends Cubit<DeleteBankState> {
  DeleteBankCubit() : super(DeleteBankInitialState());
  final _deleteBankRepository = DeleteBankRepository();
  final logger = Logger();

  removeBank(DeleteBankRequest request) async {
    try {
      final res = await _deleteBankRepository.deleteBank(request);
      if (res.success == true) {
        emit(DeleteBankSuccessState());
      } else {
        emit(DeleteBankFailureState(res.message ?? "error"));
      }
    } catch (e) {
      emit(DeleteBankFailureState(e.toString()));
    }
  }
}
