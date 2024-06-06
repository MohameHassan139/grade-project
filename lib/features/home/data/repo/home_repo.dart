import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/category.dart';
import '../models/offer_model.dart';
import '../models/product.dart';

abstract class HomeRepo {
  Future<Either<CategoryModel, Failuer>> getCategory();
  Future<Either<Offermodel, Failuer>> getSpacialProdect();
  Future<Either<List<ProductModel>, Failuer>> getProducts();
}
