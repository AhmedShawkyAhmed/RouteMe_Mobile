import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/models/users/login_model.dart';
import 'package:mobile/network/end_points.dart';
import 'package:mobile/network/remote/dio_helper.dart';
import 'package:mobile/screens/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModle? loginModel;

  void userLogin({
    required String? server,
    required String? email,
    required String? password,
  })
  {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      query:
      {
        'server': server,
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
     loginModel = LoginModle.fromJSON(value.data);
      emit(LoginSuccessState(loginModel!));
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