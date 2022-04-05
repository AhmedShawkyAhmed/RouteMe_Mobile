// import 'package:dio/dio.dart';

// class DioHelper 
// {
//  static late Dio dio;

//   static init()
//   {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://route-me2022.herokuapp.com/api/',
//         receiveDataWhenStatusError: true,
//     ),
//     );
//   }

//   static Future<Response> getData({
//     required String url,
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//     }) async
//   {

//    return await dio.get('login');
//   }

//   static Future<Response> postData({
//     required String url,
//     Map<String, dynamic>? query,
//     required Map<String, dynamic>? data,
//     }) async
//   {

//    return await dio.post(url,data: data);
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{

  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'https://route-me2022.herokuapp.com/api/',
        receiveDataWhenStatusError: true
      )
    );
  }

  static Future<Response> getData({
    @required String? url ,
    @required Map<String, dynamic>? query
  }
    ) async{
    return await dio!.get(url!,
        queryParameters: query);
  }

  static Future<Response> postData({

    @required String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    FormData? formData,
    String lang = 'ar',
    String? token,
  }) async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      // 'lang':lang,
    };

    return dio!.post(url!,data: data);
  }

  static Future<Response> postMultipartData({

    @required String? url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    FormData? formData,
    String lang = 'ar',
    String? token,
  }) async
  {
    dio!.options.headers =
    {
      'Content-Type':'multipart/form-data',
      // 'lang':lang,
    };

    return dio!.post(url!,data: formData);
  }
}