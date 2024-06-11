import 'package:ar_shopping/core/errors/failures.dart';
import 'package:ar_shopping/features/profile/data/models/profile_model.dart';
import 'package:ar_shopping/features/profile/data/models/udate_respose.dart';
import 'package:ar_shopping/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../constants/endpoint.dart';
import '../../../../core/api/api_service.dart';
import '../../../auth/data/models/auth_model.dart';
import '../models/update_user.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<Either<void, Failuer>> deletAccount() async {
    try {
      var data = await ApiService.api.delete(
        quray: ApiConstant.delete,
        data: {
        "_method": "delete",
      }
      );

      return left(data);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Profile, Failuer>> getProfile() async {
    try {
      var data = await ApiService.api.get(
        quray: ApiConstant.getCurrentUser,
      );

      Profile response = await Profile.fromJson(data);

      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<void, Failuer>> logout() async {
    try {
      var data = await ApiService.api.get(
        quray: ApiConstant.Logout,
      );

      return left(data);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<UpdateProfile, Failuer>> updateProfile(
      {required UpdateUser model}) async {
    try {
      var data = await ApiService.api.put(
        
        quray: ApiConstant.update,
        data: model.toJson(),
      );
      UpdateProfile response = await UpdateProfile.fromJson(data);

      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }
}
