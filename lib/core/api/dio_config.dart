import 'package:dio/dio.dart';

import '../utils/cashe_helper.dart';

class DioConfig {
  static Dio getDio() {
    Dio dio = Dio(
      BaseOptions(
          receiveDataWhenStatusError: true, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${CacheHelper.prefs?.getString('token')}"
      }
      ),

    );
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
