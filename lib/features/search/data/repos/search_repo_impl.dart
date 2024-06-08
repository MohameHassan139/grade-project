import 'dart:math';
import 'package:ar_shopping/constants/endpoint.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/errors/failures.dart';
import '../../../home/data/models/product.dart';
import '../models/product_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<ProductsModel, Failuer>> fetchSearched(
      {required String category}) async {
    try {
      var data = await ApiService.api.post(
          quray:
              ApiConstant.search,
              data: {
                "search":category
              }
              );
      ProductsModel products = ProductsModel.fromJson(data);
      return left(products);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
    }
    return right(ServerFailuer(errorMessage: e.toString()));
  }
}
