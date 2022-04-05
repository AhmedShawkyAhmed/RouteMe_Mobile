

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/models/users/login_model.dart';
import 'package:mobile/network/remote/dio_helper.dart';

class MyServes extends ChangeNotifier{
  LoginResponse? login;
  dynamic v;
  

  Future userLogin({
    required String? server,
    required String? email,
    required String? password,
  })async {
  await  DioHelper.postData(
      url: 'login',
      data: {
        'server': server,
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      final Map<String,dynamic> data = json.decode(value.data);
                              login = LoginResponse.fromJson(data);



      v = value.statusCode;
      notifyListeners();
      print(login!.message);
    }).catchError((error) {
      print('response+$login');
      print('response+$v');
      print(error.toString());
    });
  }
}