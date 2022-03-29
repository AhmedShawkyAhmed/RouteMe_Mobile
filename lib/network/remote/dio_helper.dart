import 'package:dio/dio.dart';

class DioHelper 
{
 static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://route-me2022.herokuapp.com/api/',
        receiveDataWhenStatusError: true,
    ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    }) async
  {

   return await dio.get('login');
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    }) async
  {

   return await dio.post(
     url,
     queryParameters: query,
     data: data,
   );
  }
}