import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'package:get_storage/get_storage.dart';
import 'package:haftsara_blog/components/storage_const.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: "GET"))
        .then((onValue) {
      // log(onValue.toString());
      return onValue;
    }).catchError((error) {
      if(error is DioException) {
        return error.response!;
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    var token = GetStorage().read(StorageConst.token);
    if(token != null) {
      dio.options.headers['authorization'] = token.toString();
      // dio.options.headers['authorization'] = 'Bearer $token';
    }
    return await dio.post(url,
        data: dio_service.FormData.fromMap(map),
        options: Options(responseType: ResponseType.json, method: 'POST')).then((onValue) {
          log(onValue.headers.toString());
          log(onValue.data.toString());
          log(onValue.statusCode.toString());
          return onValue;
        }).catchError((error){
          if(error is DioException) {
            return error.response!;
          }
        });
  }
}
