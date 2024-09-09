abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final String error;
  RegisterFailureState(this.error);
}

class RegisterSuccessState extends RegisterState {}
