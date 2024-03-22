import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/auth_test_model.dart';

abstract class AuthRepo {
  Future<Either<AuthModel, Failuer>> login(
      {required String email, required String password});
  Future<Either<AuthModel, Failuer>> register();
  Future<Either<AuthModel, Failuer>> forgetPassword({required String email});
  Future<Either<AuthModel, Failuer>> resetPassword(
      {required String email, required String password});
}
