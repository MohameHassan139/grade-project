part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

// final class GetProductsLoading extends HomeCubitState {}

// final class GetProductsFailure extends HomeCubitState {
//   final String error;
//   GetProductsFailure({required this.error});
// }

// final class GetProductsSuccess extends HomeCubitState {
//   final ProductsModel products;
//   GetProductsSuccess({required this.products});
// }

final class GetSpacialOffertsLoading extends HomeCubitState {}

final class GetSpacialOfferFailure extends HomeCubitState {
  final String error;
  GetSpacialOfferFailure({required this.error});
}

final class GetSpacialOfferSuccess extends HomeCubitState {
  final Offermodel products;
  GetSpacialOfferSuccess({required this.products});
}
