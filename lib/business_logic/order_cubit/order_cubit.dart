import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:mobile/data/models/order_model.dart';
import 'package:mobile/data/network/responses/order_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<List<OrderModel>> {
  OrderCubit() : super([]);
  static OrderCubit get(context) => BlocProvider.of(context);

  OrderResponse? orderResponse;

  Future getOrders() async {
    await DioHelper.postData(
      url: vendorOrders,
      body: {
        'vendorId': CacheHelper.getDataFromSharedPreference(key: "userId"),
      },
    ).then((value) {
      //print(value.data);
      final myData = Map<String, dynamic>.from(value.data);
      orderResponse = OrderResponse.fromJson(myData);
      if (orderResponse!.status == 200) {
        print(orderResponse!.orders![0].clientName);
        return orderResponse!.orders;
      } else {
        print(orderResponse!.message);
        return orderResponse!.message;
      }
    }).catchError((error) {
      print(error.toString());
    });
    return orderResponse!.orders;
  }

  void get myOrders async => emit(await getOrders());
}
