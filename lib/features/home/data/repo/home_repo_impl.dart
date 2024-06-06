import 'dart:convert';

import 'package:ar_shopping/core/errors/failures.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:ar_shopping/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../constants/endpoint.dart';
import '../../../../core/api/api_service.dart';
import '../models/category.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Category, Failuer>> getCategory() async {
    try {
      var data = await ApiService.api.get(
        quray: ApiConstant.categorytUrl,
      );
      Category response = Category.fromJson(data);
      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<List<ProductModel>, Failuer>> getSpacialProdect() async {
    print('@@@@@@@@@@@@@@@@ 2 <=======');

    try {
      var data = await ApiService.api.get(quray: ApiConstant.discountUrl);
      print('@@@@@@@@@@@@@@@@ 3 <=======');

      List<ProductModel> productModels = dataHandling(data);
      print('@@@@@@@@@@@@@@@@ 4 <=======');

      return left(productModels);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<List<ProductModel>, Failuer>> getProducts() async {
    try {
      var data = await ApiService.api.get(
        quray: ApiConstant.categorytUrl,
      );

      List<ProductModel> productModels = dataHandling(data);

      return left(productModels);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }
}

List<ProductModel> dataHandling(dynamic data) {
  List<ProductModel> productModels = [];

  print('@@@@@@@@@@@@@@@@ 1 <=======');
  // Parsing JSON string
  // List<dynamic> jsonData = json.decode(data);
  // ProductModel productModel;

  data.forEach((e) {
    print('@@@@@@@@@@@@@@@@');
    print(e);
    productModels.add(ProductModel.fromJson(e as Map<String, dynamic>));
  });

  return productModels;
}
