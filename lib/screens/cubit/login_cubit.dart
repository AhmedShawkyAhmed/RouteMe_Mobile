import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/models/users/login_model.dart';
import 'package:mobile/network/end_points.dart';
import 'package:mobile/network/remote/dio_helper.dart';
import 'package:mobile/screens/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginResponse? loginModel;

  void userLogin({
    required String? server,
    required String? email,
    required String? password,
  })
  {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'server': server,
        'email': email,
        'password': password,
      },
    ).then((value)
    {

      print(value.data);
      print('lol');
      final String data = json.decode(value.data.toString());
      //print(data[0]['name']);
      print('done 1');
     //loginModel = LoginResponse.fromJson(data);
     print('done 2');

      print(value.statusCode);
     loginModel = LoginModle.fromJSON(value.data);

      emit(LoginSuccessState(loginModel!));
      print('done3');
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ChangePasswordVisibilityState());
  }
}