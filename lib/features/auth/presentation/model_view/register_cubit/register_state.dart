part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}


final class RegisterLoading extends RegisterInitial {}

final class RegisterFailure extends RegisterInitial {
  final String error;
  RegisterFailure({required this.error});
}

final class RegisterSuccess extends RegisterInitial {
  final AuthModel model;
  RegisterSuccess({required this.model});
}

final class ShowPasswordstate extends RegisterInitial {}
