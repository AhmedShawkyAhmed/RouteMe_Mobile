import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/network/responses/order_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';

part 'order_cubit_state.dart';

class OrderCubitCubit extends Cubit<OrderCubitState> {
  OrderCubitCubit() : super(OrderCubitInitial());
  static OrderCubitCubit get(context) => BlocProvider.of(context);

  OrderResponse? orderResponse;

  Future orderStatus({
    required int? vendorId,
    required String endPoint,
  }) async {
    emit(OrderLoadingState());
    await DioHelper.postData(url: endPoint, body: {
       "vendorId": vendorId,
    }).then((value) {
      print(value.data);
      final myData = Map<String, dynamic>.from(value.data);
      orderResponse = OrderResponse.fromJson(myData);
      if (orderResponse!.status == 200) {
        emit(OrderSuccessState(orderResponse!));
       
      } else {
        print(orderResponse!.message);
      }
    }).catchError((error) {
      emit(OrderErrorState(error.toString()));
      print(error.toString());
    });
  }
}
