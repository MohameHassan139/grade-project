import 'dart:io';

import 'package:ar_shopping/core/utils/cashe_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../auth/data/models/auth_model.dart';
import '../../../data/models/profile_model.dart';
import '../../../data/models/udate_respose.dart';
import '../../../data/models/update_user.dart';
import '../../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  ProfileRepo profileRepo;
  Profile? profileModel;
  final ImagePicker picker = ImagePicker();
  File? profileImage;
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  UpdateProfile? updateProfilemodel;
  Future<void> getProfile() async {
    emit(GetProfileLoading());
    var result = await profileRepo.getProfile();
    result.fold((success) {
      profileModel = success;
      handelDataController();
      emit(GetProfileSuccess());
    }, (failure) {
      emit(GetProfileFailure(error: failure.errorMessage));
    });
  }

  Future<void> updateProfile() async {
    emit(UpdateProfileLoading());
    var result = await profileRepo.updateProfile(model: handelUserModel());
    result.fold((success) {
      updateProfilemodel = success;
      profileModel?.user = success.user;
      handelDataController();
      getProfile();
      emit(UpdateProfileSuccess());
    }, (failure) {
      emit(UpdateProfileFailure(error: failure.errorMessage));
    });
  }

  Future<void> logout() async {
    emit(logoutLoading());
    var result = await profileRepo.logout();
    result.fold((success) {
      CacheHelper.prefs?.clear();
      emit(logoutSuccess());
    }, (failure) {
      emit(logoutFailure(error: failure.errorMessage));
    });
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    var result = await profileRepo.deletAccount();
    result.fold((success) {
      CacheHelper.prefs?.clear();

      emit(DeleteAccountSuccess());
    }, (failure) {
      emit(DeleteAccountFailure(error: failure.errorMessage));
    });
  }

  UpdateUser handelUserModel() {
    return UpdateUser(
      address: addressController.text,
      email: emailController.text,
      image: profileImage,
      name: nameController.text,
      phone: phoneController.text,
    );
  }

  void handelDataController() {
    emailController.text = profileModel?.user?.email ?? '';
    phoneController.text = profileModel?.user?.phone ?? '';
    nameController.text = profileModel?.user?.name ?? '';
    addressController.text = profileModel?.user?.address ?? '';
  }

  Future<void> getProfileImage() async {
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        emit(ProfileImageUpdated(profileImage: profileImage!));
      } else {
        print('No Image Selected');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
