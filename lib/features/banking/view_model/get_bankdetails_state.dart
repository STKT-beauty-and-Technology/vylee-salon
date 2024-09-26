import 'package:vylee_partner/features/banking/model/get_bankdetails_response.dart';

abstract class GetBankdetailsState {}

class GetBankdetailsInitialState extends GetBankdetailsState {}

class GetBankdetailsLoadingState extends GetBankdetailsState {}

class GetBankdetailsFailureState extends GetBankdetailsState {
  final String error;
  GetBankdetailsFailureState(this.error);
}

class GetBankdetailsSuccessState extends GetBankdetailsState {
  final List<GetBankDetailsResponse> bankDetails;
  GetBankdetailsSuccessState(this.bankDetails);
}
