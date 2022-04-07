import 'package:flutter/material.dart';
import 'package:mobile/data/network/responses/login_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';

class MyService extends ChangeNotifier{
  LoginResponse? login;

  Future userLogin({
    required String? server,
    required String? email,
    required String? password,
    required String endPoint,
  })async {
    await DioHelper.postData(
      url: endPoint,
        body: {
        'server': server,
        'email': email,
        'password': password,
      }
    ).then((value){
      print(value.data);
      final myData = Map<String, dynamic>.from(value.data);
      login = LoginResponse.fromJson(myData);
      if(login!.status == 200){
        print(login!.user![0].name);
      }else{
        print(login!.message);
      }
    });
  }
}