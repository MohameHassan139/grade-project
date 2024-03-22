import 'package:ar_shopping/core/errors/failures.dart';
import 'package:ar_shopping/features/auth/data/models/auth_test_model.dart';
import 'package:ar_shopping/features/auth/data/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_service.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<AuthModel, Failuer>> login(
      {required String email, required String password}) async {
    try {
      var data = await ApiService.api.post(
          quray: 'volumes?Filtering=free-ebooks&q=flutter&Sorting=newest',
          data: {
            'email': email,
            'password': password,
          });
      AuthModel response = AuthModel.fromJson(data);
      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<AuthModel, Failuer>> register() async {
    try {
      var data = await ApiService.api
          .post(quray: 'volumes?Filtering=free-ebooks&q=subject:science');
      AuthModel response = AuthModel.fromJson(data);
      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<AuthModel, Failuer>> forgetPassword(
      {required String email}) async {
    try {
      var data = await ApiService.api.post(
        quray: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:',
      );

      AuthModel response = AuthModel.fromJson(data);

      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<AuthModel, Failuer>> resetPassword(
      {required String email, required String password}) async {
    try {
      var data = await ApiService.api.post(
        quray: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:',
      );

      AuthModel response = AuthModel.fromJson(data);

      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }
}
