import 'package:dio/dio.dart';

import '../utils/cashe_helper.dart';

// class DioConfig {
//   static Dio getDio() {
//     Dio dio = Dio(

//       BaseOptions(

//         receiveDataWhenStatusError: true, headers: {
//         "Accept": "application/json",
//         "Authorization": "Bearer ${CacheHelper.prefs?.getString('token')}"
//         // "Authorization":
//         //     "Bearer 4|HcuT4h5sm9BTH1xl7439486FtE8uSw2D40JtQRLpb1ca5f05"
//       }
//       ),

//     );
//     dio.interceptors.add(LogInterceptor(responseBody: true));
//     return dio;
//   }
// }

class DioConfig {
  static final DioConfig _instance = DioConfig._();
  final Dio _dio = Dio();

  factory DioConfig() => _instance;

  DioConfig._() {
    _dio.options = BaseOptions(
      receiveDataWhenStatusError: true,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${CacheHelper.prefs?.getString('token')}"
      },
    );
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Dio get dio => _dio;
}
