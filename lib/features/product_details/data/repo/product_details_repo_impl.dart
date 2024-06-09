import 'dart:convert';
import 'dart:ffi';

import 'package:ar_shopping/core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../constants/endpoint.dart';
import '../../../../core/api/api_service.dart';
import 'product_details_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<double, Failuer>> getProductRate({required int id}) async {
    try {
      var data = await ApiService.api.get(
        quray: "${ApiConstant.review}/$id",
      );
      // data = data;
      double review = 1.5;
      if (data['message'] != null) {
        review = 0;
      } else {
        review = double.parse(data['review'].toString());
      }

      return left(review);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<void, Failuer>> addProductComment(
      {required int id, required String comment}) async {
    try {
      var data = await ApiService.api
          .post(quray: "${ApiConstant.addComment}/$id", data: {
        "comment": comment,
      });

      return left(data);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<void, Failuer>> addProductRate(
      {required int id, required double rate}) async {
    try {
      var data = await ApiService.api
          .post(quray: "${ApiConstant.addComment}/$id", data: {
        "review": rate,
      });

      return left(data);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }
}
