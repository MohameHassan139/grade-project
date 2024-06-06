import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/cashe_helper.dart';
import '../../../data/models/auth_model.dart';
import '../../../data/models/user_data.dart';
import '../../../data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  var emailController = TextEditingController();
  var comfirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  AuthModel? model;
  UserData? userData;

  RegisterCubit({required this.authRepo}) : super(RegisterInitial());
  AuthRepo authRepo;
  Future<void> register() async {
    emit(RegisterLoading());
    userData = dataHandle();
    var result = await authRepo.register(userData: userData!);
    result.fold((success) {
      CacheHelper.prefs?.setString('token', success.token ?? '');
      model = success;
      emit(RegisterSuccess(model: success));
    }, (failure) {
      emit(RegisterFailure(error: failure.errorMessage));
    });
  }

  bool showPassword = false;
  void isShown() {
    showPassword = !showPassword;
    emit(ShowPasswordstate());
  }

  UserData dataHandle() {
    UserData userData = UserData(
      address: addressController.text,
      confirmPassword: comfirmPasswordController.text,
      email: emailController.text,
      // image: ,
      name: nameController.text,
      password: passwordController.text,
      phone: phoneController.text,
    );
    return userData;
  }
}
