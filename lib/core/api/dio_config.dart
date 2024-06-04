import 'package:dio/dio.dart';

class DioConfig {
  static Dio getDio() {
    Dio dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
