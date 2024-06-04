
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/product_model.dart';

abstract class SearchRepo {
  Future<Either<ProductModels, Failuer>> fetchSearchedrBooks(
      {required String category});
}
