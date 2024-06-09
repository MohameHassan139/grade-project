part of 'add_review_cubit.dart';

@immutable
sealed class AddReviewState {}

final class AddReviewInitial extends AddReviewState {}

final class BottomSheetClosed extends AddReviewState {}

final class BottomSheetOpened extends AddReviewState {}

final class AddCommentLoading extends AddReviewState {}

final class AddCommentSccess extends AddReviewState {}

final class AddCommentFailure extends AddReviewState {
  String error;
  AddCommentFailure({required this.error});
}

final class AddRateLoading extends AddReviewState {}

final class AddRatetSccess extends AddReviewState {}

final class AddRateFailure extends AddReviewState {
  String error;
  AddRateFailure({required this.error});
}

// onSubmit

final class onSubmitLoading extends AddReviewState {}

final class onSubmitSccess extends AddReviewState {}

final class onSubmitFailure extends AddReviewState {}


final class GetCommentLoading extends AddReviewState {}

final class GetCommentSccess extends AddReviewState {}

final class GetCommentFailure extends AddReviewState {
  String error;
  GetCommentFailure({required this.error});
}
