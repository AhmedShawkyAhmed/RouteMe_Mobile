import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:mobile/data/network/responses/getBranches_response.dart';
import 'package:mobile/data/network/responses/successful_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';
import 'package:mobile/presentation/widgets/toast.dart';

part 'pickup_state.dart';

class PickupCubit extends Cubit<List<dynamic>> {
  PickupCubit() : super([]);

  static PickupCubit get(context) => BlocProvider.of(context);

  SuccessfulResponse? successfulResponse;
  GetBranchesResponse? getBranchesResponse;

  List branchesName = [];

  Future getBranches() async {
    await DioHelper.postData(
      url: branches,
      body: {
        'vendorId': CacheHelper.getDataFromSharedPreference(key: "userId"),
      },
    ).then((value) {
      print(value.data);
      final myData = Map<String, dynamic>.from(value.data);
      getBranchesResponse = GetBranchesResponse.fromJson(myData);
      if (getBranchesResponse!.status == 200) {
        print(getBranchesResponse!.branches![0].branchName);
        for (int y = 0; y <= getBranchesResponse!.branches!.length; y++) {
          branchesName.add(getBranchesResponse!.branches![y].branchName);
        }
        return branchesName;
      } else {
        print(getBranchesResponse!.message);
        return getBranchesResponse!.message;
      }
    }).catchError((error) {
      print(error.toString());
    });
    return branchesName;
  }

  Future requestPickup({
    required String name,
    required String phone,
    required String count,
    required String price,
    required String branch,
    required String address,
    required double lon,
    required double lat,
  }) async {
    await DioHelper.postData(
      url: pickup,
      body: {
        'clientName': name,
        'clientPhone': phone,
        'itemCount': count,
        'price': price,
        'branch': branch,
        'vendorId': CacheHelper.getDataFromSharedPreference(key: "userId"),
        'lon': lon,
        'lat': lat,
        'address': address,
        'state': 'Pick Up',
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      successfulResponse = SuccessfulResponse.fromJson(myData);
      showToast(successfulResponse!.message);
    }).catchError((error) {
      showToast(error.toString());
    });
    return successfulResponse!.message;
  }

  void get myBranches async => emit(await getBranches());
}
