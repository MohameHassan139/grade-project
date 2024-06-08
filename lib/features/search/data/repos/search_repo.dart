
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../home/data/models/product.dart';


abstract class SearchRepo {
  Future<Either<ProductsModel, Failuer>> fetchSearched(
      {required String category});
}
