import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:mobile/data/models/order_model.dart';
import 'package:mobile/data/network/responses/order_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';
import 'package:mobile/presentation/widgets/toast.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<List<OrderModel>> {
  OrderCubit() : super([]);

  static OrderCubit get(context) => BlocProvider.of(context);

  OrderResponse? orderResponse, searchResponse;

  Future getOrders() async {
    await DioHelper.postData(
      url: vendorOrders,
      body: {
        'vendorId': CacheHelper.getDataFromSharedPreference(key: "userId"),
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      orderResponse = OrderResponse.fromJson(myData);
      if (orderResponse!.status == 200) {
        return orderResponse!.orders;
      } else {
        return orderResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return orderResponse!.orders;
  }

  Future searchOrders({
    VoidCallback? afterSuccess,
    String? orderId,
  }) async {
    await DioHelper.postData(
      url: vendorOrders,
      body: {
        'vendorId': CacheHelper.getDataFromSharedPreference(key: "userId"),
        'orderId': orderId,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      searchResponse = OrderResponse.fromJson(myData);
      if (searchResponse!.status == 200) {
        afterSuccess!();
        return searchResponse!.orders;
      } else {
        showToast(searchResponse!.message);
        return searchResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return searchResponse!.orders;
  }

  void get myOrders async => emit(await getOrders());
}
