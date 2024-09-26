import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/banking/model/add_bankAccount_request.dart';
import 'package:vylee_partner/features/banking/view_model/addBank_state.dart';
import 'package:vylee_partner/model/repositories/add_bank_repository.dart';

class AddBankCubit extends Cubit<AddBankState> {
  AddBankCubit() : super(AddBankInitialState());
  final _addBankRepository = AddBankRepository();
  final logger = Logger();

  addBankDetail(AddBankAccountRequest request) async {
    try {
      final res = await _addBankRepository.addBank(request);
      if (res.success == true) {
        emit(AddBankSuccessState());
      } else {
        emit(AddBankFailureState(res.message ?? "error"));
      }
    } catch (e) {
      emit(AddBankFailureState(e.toString()));
    }
  }
}
