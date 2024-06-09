import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<double, Failuer>> getProductRate({required int id});
  Future<Either<void, Failuer>> addProductRate(
      {required int id, required double rate});
  Future<Either<void, Failuer>> addProductComment(
      {required int id, required String comment});
}
