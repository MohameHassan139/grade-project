import 'package:ar_shopping/core/utils/cashe_helper.dart';
import 'package:ar_shopping/features/auth/data/models/auth_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AuthModel? model;
  bool isloading = false;
  LoginCubit({required this.authRepo}) : super(LoginInitial());
  AuthRepo authRepo;
  Future<void> login({required String email, required String password}) async {
    isloading = true;
    emit(LoginLoading());
    var result = await authRepo.login(email: email, password: password);
    result.fold((success) {
      CacheHelper.prefs?.setString('token', success.token!);
      model = success;
      emit(LoginSuccess(model: success));
    }, (failure) {
      emit(LoginFailure(error: failure.errorMessage));
    });
  }

  bool showPassword = false;
  void isShown() {
    showPassword = !showPassword;
    emit(ShowPasswordstate());
  }
}
