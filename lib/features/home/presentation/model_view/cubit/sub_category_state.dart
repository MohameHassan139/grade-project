part of 'sub_category_cubit.dart';

@immutable
sealed class SubCategoryState {}

final class SubCategoryInitial extends SubCategoryState {}

final class GetSubCategoryLoading extends SubCategoryInitial {}

final class GetSubCategoryFailure extends SubCategoryInitial {
  final String error;
  GetSubCategoryFailure({required this.error});
}

final class GetSubCategorySuccess extends SubCategoryInitial {
  final ProductsModel products;
  GetSubCategorySuccess({required this.products});
}
