import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/network/remote/dio_helper.dart';
import 'package:mobile/shared/cubit/states.dart';

import '../../screens/vendor/branch_screen.dart';
import '../../screens/vendor/order_status_screen.dart';
import '../../screens/vendor/request_pick_up_screen.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  
  int currentIndex = 0;
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.add;

  final List<Widget> children = [
    OrderStatusScreen(),
    requestPickUpScreen(),
    BranchScreen(),
  ];

  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  
}

void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }){
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  // List<dynamic> branch = [];

  // void getBranch() 
  // {
  //   emit(AppGetBranchLodingState());
  //   DioHelper.getData(url: 'getBranches', query: {
  //             "key": "vendorId",
	// 						"value": "13"
  //   }).then((value) {
  //     //print(value.data.toString());
  //     branch = value.data['api'];
  //     print(branch[0]['getBranches']);
  //     emit(AppGetBranchSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(AppGetBranchErrorState(error.toString()));
  //   });
  // }
}