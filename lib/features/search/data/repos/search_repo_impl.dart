import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/errors/failures.dart';
import '../../../home/data/models/product.dart';
import '../models/product_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<ProductsModel, Failuer>> fetchSearchedrBooks(
      {required String category}) async {
    try {
      var data = await ApiService.api.get(
          quray:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category');
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
