part of 'pickup_cubit.dart';

@immutable
abstract class PickupState {}

class PickupInitial extends PickupState {}

class PickupLoadingState extends PickupState {}

class PickupSuccessState extends PickupState {
  final SuccessfulResponse successfulResponse;

  PickupSuccessState(this.successfulResponse);
}

class PickupErrorState extends PickupState {
  final String error;

  PickupErrorState(this.error);
}