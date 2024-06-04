part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class GetProductsLoading extends HomeCubitState {}

final class GetProductsFailure extends HomeCubitState {
  final String error;
  GetProductsFailure({required this.error});
}

final class GetProductsSuccess extends HomeCubitState {
  final List<ProductModel> products;
  GetProductsSuccess({required this.products});
}

final class GetSpacialOffertsLoading extends HomeCubitState {}

final class GetSpacialOfferFailure extends HomeCubitState {
  final String error;
  GetSpacialOfferFailure({required this.error});
}

final class GetSpacialOfferSuccess extends HomeCubitState {
  final List<ProductModel> products;
  GetSpacialOfferSuccess({required this.products});
}

final class GetCategoryLoading extends HomeCubitState {}

final class GetCategoryFailure extends HomeCubitState {
  final String error;
  GetCategoryFailure({required this.error});
}

final class GetCategorySuccess extends HomeCubitState {
  final List<ProductModel> products;
  GetCategorySuccess({required this.products});
}
