abstract class DeleteBankState {}

class DeleteBankInitialState extends DeleteBankState {}

class AddBankLoadingState extends DeleteBankState {}

class DeleteBankFailureState extends DeleteBankState {
  final String error;
  DeleteBankFailureState(this.error);
}

class DeleteBankSuccessState extends DeleteBankState {}
