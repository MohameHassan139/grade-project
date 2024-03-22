import 'package:dio/dio.dart';

abstract class Failuer {
  String errorMessage;
  Failuer({
    required this.errorMessage,
  });
}

class ServerFailuer extends Failuer {
  ServerFailuer({required super.errorMessage});

  factory ServerFailuer.fromDioError({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        {
          return ServerFailuer(errorMessage: 'Connection timeout with server');
        }
      case DioExceptionType.sendTimeout:
        {
          return ServerFailuer(errorMessage: 'Send timeout with server');
        }
      case DioExceptionType.receiveTimeout:
        {
          return ServerFailuer(errorMessage: 'Receive timeout with server');
        }
      case DioExceptionType.badCertificate:
        {
          return ServerFailuer(errorMessage: ' Please Re-login  ');
        }
      case DioExceptionType.badResponse:
        {
          return ServerFailuer.fromResponse(
              response: dioException.response!.data,
              statusCode: dioException.response!.statusCode!);
        }
      case DioExceptionType.cancel:
        {
          return ServerFailuer(errorMessage: 'Request to server was canceled');
        }
      case DioExceptionType.connectionError:
        {
          return ServerFailuer(errorMessage: 'No Internet Connection');
        }
      case DioExceptionType.unknown:
        {
          return ServerFailuer(
              errorMessage: 'Unexpected error, Please Later Try');
        }
      default:
        return ServerFailuer(
            errorMessage: 'Opps There an Error, Please Later Try  ');
    }
  }

  factory ServerFailuer.fromResponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      // this chage base on api response of error cases
      return ServerFailuer(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailuer(
          errorMessage: 'Your Request  Not Found, Please Later Try');
    } else if (statusCode == 500) {
      return ServerFailuer(
          errorMessage: 'Internal Server Error, Please Later Try  ');
    } else {
      return ServerFailuer(
          errorMessage: 'Opps There an Error, Please Later Try  ');
    }
  }
}
