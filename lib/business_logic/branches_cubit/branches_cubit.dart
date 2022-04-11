import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/network/responses/getBranches_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';

part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit() : super(BranchesInitial());

  static BranchesCubit get(context) => BlocProvider.of(context);

  GetBranchesResponse? getBranchesResponse;

  Future getBranches({
    required int vendorId,
    required String endPoint,
  }) async {
    emit(BranchesLoadingState());
    await DioHelper.postData(url: endPoint, body: {
      'vendorId': vendorId,
    }).then((value) {
      print(value.data);
      final myData = Map<String, dynamic>.from(value.data);
      getBranchesResponse = GetBranchesResponse.fromJson(myData);
      if (getBranchesResponse!.status == 200) {
        emit(BranchesSuccessState(getBranchesResponse!));
        print(getBranchesResponse!.branches![0].branchName);
      } else {
        print(getBranchesResponse!.message);
      }
    }).catchError((error) {
      emit(BranchesErrorState(error.toString()));
      print(error.toString());
    });
    return getBranchesResponse;
  }
}
