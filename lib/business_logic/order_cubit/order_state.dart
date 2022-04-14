part of 'order_cubit.dart';

@immutable
abstract class OrderCubitState {}

class OrderCubitInitial extends OrderCubitState {}

class OrderLoadingState extends OrderCubitState {}

class OrderSuccessState extends OrderCubitState {
  final OrderResponse orderResponse;

  OrderSuccessState(this.orderResponse);
}

class OrderErrorState extends OrderCubitState {
  final String error;

  OrderErrorState(this.error);
}
