import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/category.dart';
import '../models/product.dart';

abstract class HomeRepo {
  Future<Either<Category, Failuer>> getCategory();
  Future<Either<List<ProductModel>, Failuer>> getSpacialProdect();
  Future<Either<List<ProductModel>, Failuer>> getProducts();
}
