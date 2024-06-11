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
final class UpdateProfileLoading extends ProfileInitial {}

final class UpdateProfileSuccess extends ProfileInitial {}

final class UpdateProfileFailure extends ProfileInitial {
  String error;
  UpdateProfileFailure({required this.error});
}

final class logoutLoading extends ProfileInitial {}

final class logoutSuccess extends ProfileInitial {}

final class logoutFailure extends ProfileInitial {
  String error;
  logoutFailure({required this.error});
}

final class DeleteAccountLoading extends ProfileInitial {}

final class DeleteAccountSuccess extends ProfileInitial {}

final class DeleteAccountFailure extends ProfileInitial {
  String error;
  DeleteAccountFailure({required this.error});
}

final class ProfileImageUpdated extends ProfileInitial {
  File profileImage;
  ProfileImageUpdated({required this.profileImage});
}
