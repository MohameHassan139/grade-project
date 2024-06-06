part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class GetCategoryLoading extends CategoryInitial {}

final class GetCategoryFailure extends CategoryInitial {
  final String error;
  GetCategoryFailure({required this.error});
}

final class GetCategorySuccess extends CategoryInitial {
  final CategoryModel categories;
  GetCategorySuccess({required this.categories});
}
