part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileLoading extends ProfileInitial {}

final class GetProfileSuccess extends ProfileInitial {}

final class GetProfileFailure extends ProfileInitial {
  String error;
  GetProfileFailure({required this.error});
}
