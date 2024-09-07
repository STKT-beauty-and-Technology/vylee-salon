abstract class AddressState {}

class AddressInitialState extends AddressState {}

class AddressLoadingState extends AddressState {}

class AddressFailureState extends AddressState {
  final String error;
  AddressFailureState(this.error);
}

class AddressSuccessState extends AddressState {}
