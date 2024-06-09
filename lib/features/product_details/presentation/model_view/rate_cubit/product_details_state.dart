part of 'product_details_cubit.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class GetReviewLoading extends ReviewInitial {}

final class GetReviewFailure extends ReviewInitial {
  final String error;
  GetReviewFailure({required this.error});
}

final class GetReviewSuccess extends ReviewInitial {
  final double review;
  GetReviewSuccess({required this.review});
}

// New states for bottom sheet

