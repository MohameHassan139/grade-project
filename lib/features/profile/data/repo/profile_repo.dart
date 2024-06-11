import 'package:ar_shopping/features/auth/data/models/auth_model.dart';
import 'package:ar_shopping/features/profile/data/models/profile_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_data.dart';
import '../models/udate_respose.dart';
import '../models/update_user.dart';

abstract class ProfileRepo {
  Future<Either<Profile, Failuer>> getProfile();
  Future<Either<UpdateProfile, Failuer>> updateProfile(
      {required UpdateUser model});
  Future<Either<void, Failuer>> logout();
  Future<Either<void, Failuer>> deletAccount();
}
