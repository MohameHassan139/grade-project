part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String error;
  LoginFailure({required this.error});
}

final class LoginSuccess extends LoginState {
  final AuthModel model;
  LoginSuccess({required this.model});
}

final class ShowPasswordstate extends LoginState {}
