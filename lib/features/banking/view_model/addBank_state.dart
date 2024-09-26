abstract class AddBankState {}

class AddBankInitialState extends AddBankState {}

class AddBankLoadingState extends AddBankState {}

class AddBankFailureState extends AddBankState {
  final String error;
  AddBankFailureState(this.error);
}

class AddBankSuccessState extends AddBankState {}
