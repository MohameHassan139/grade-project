import 'dart:convert';

import 'package:ar_shopping/core/errors/failures.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:ar_shopping/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../constants/endpoint.dart';
import '../../../../core/api/api_service.dart';
import '../models/category.dart';
import '../models/offer_model.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<CategoryModel, Failuer>> getCategory() async {
    try {
      var data = await ApiService.api.get(
        quray: ApiConstant.categorytUrl,
      );
      CategoryModel response = CategoryModel.fromJson(data);
      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Offermodel, Failuer>> getSpacialProdect() async {
    print('@@@@@@@@@@@@@@@@ 2 <=======');

    try {
      var data = await ApiService.api.get(quray: ApiConstant.discountUrl);
      print('@@@@@@@@@@@@@@@@ 3 <=======');

      Offermodel productModels = Offermodel.fromJson(data);
      print('@@@@@@@@@@@@@@@@ 4 <=======');

      return left(productModels );
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<ProductsModel, Failuer>> getProducts({required int id}) async {
    try {
      var data = await ApiService.api.get(
        quray: "${ApiConstant.subCategorytUrl}/$id",
        // quray: 'https://api.alsafwa1.com/api/homePage/subCategoryProducts/5'
      );

      ProductsModel productModels = ProductsModel.fromJson(data);

      return left(productModels);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }
}


