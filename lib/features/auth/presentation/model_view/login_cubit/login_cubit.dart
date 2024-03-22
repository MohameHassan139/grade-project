import 'package:ar_shopping/features/auth/data/models/auth_test_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());
  AuthRepo authRepo;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await authRepo.login(email: email, password: password);
    result.fold((success) {
      emit(LoginSuccess(model: success));
    }, (failure) {
      emit(LoginFailure(error: failure.errorMessage));
    });
  }
}
