import 'package:dio/dio.dart';

import 'dio_config.dart';

class ApiService {
  ApiService._();

  static final ApiService api = ApiService._();
  final Dio _dio = DioConfig.getDio();

  Future<dynamic> get({required String quray}) async {
    Response response = await _dio.get(quray);

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String quray,
    String? token,
    Object? data,
  }) async {
    Response response = await _dio.post(
      quray,
      data: data,
    );

    return response.data;
  }
}
