abstract class SalonInfoState {}

class SalonInfoInitialState extends SalonInfoState {}

class SalonInfoLoadingState extends SalonInfoState {}

class SalonInfoFailureState extends SalonInfoState {
  final String error;
  SalonInfoFailureState(this.error);
}

class SalonInfoSuccessState extends SalonInfoState {}
