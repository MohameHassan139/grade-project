import 'package:dio/dio.dart';

class DioConfig {
  static Dio getDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.googleapis.com/books/v1/',
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
