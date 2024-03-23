import 'package:dio/dio.dart';

class DioConfig {
  static Dio getDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://accept.paymob.com/api/',
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
