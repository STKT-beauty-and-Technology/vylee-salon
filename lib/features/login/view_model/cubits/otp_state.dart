abstract class OtpState {}

class OtpInitialState extends OtpState {}

class OtpLoadingState extends OtpState {}

class OtpFailureState extends OtpState {
  final String error;
  OtpFailureState(this.error);
}

class OtpSentState extends OtpState {}

class OtpSuccessState extends OtpState {}
