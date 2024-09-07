import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/features/salon_details/model/address_request.dart';
import 'package:vylee_partner/features/salon_details/view_model/cubits/address_state.dart';
import 'package:vylee_partner/model/repositories/address_repository.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitialState());
  final _addressRepository = AddressRepository();
  final logger = Logger();

  saveAddress(AddressRequest request) async {
    try {
      final res = await _addressRepository.saveAddress(request);
      if (res.success == true) {
        emit(AddressSuccessState());
      } else {
        emit(AddressFailureState(res.message ?? "error"));
      }
    } catch (e) {
      emit(AddressFailureState(e.toString()));
    }
  }
}
