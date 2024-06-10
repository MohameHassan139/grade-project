import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../data/models/profile_model.dart';
import '../../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  ProfileRepo profileRepo;
  late Profile profileModel;
  final ImagePicker picker = ImagePicker();
  File? profileImage;
  var emailController = TextEditingController();
  var comfirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  Future<void> getProfile() async {
    emit(GetProfileLoading());
    var result = await profileRepo.getProfile();
    result.fold((success) {
      profileModel = success;
      emit(GetProfileSuccess());
    }, (failure) {
      emit(GetProfileFailure(error: failure.errorMessage));
    });
  }

  Future<void> getprofileImage() async {
    final pickerFile = picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      pickerFile.then((value) {
        profileImage = File(value!.path);
        // update();
      });
    } else {
      print('No Image Selected');
    }
  }
}
