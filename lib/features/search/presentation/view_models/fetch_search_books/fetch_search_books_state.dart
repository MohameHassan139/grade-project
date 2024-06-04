part of 'fetch_search_books_cubit.dart';

sealed class FetchSearchProductsState {
  const FetchSearchProductsState();

  @override
  List<Object> get props => [];
}

final class FetchSearchproductsInitial extends FetchSearchProductsState {}

final class FetchSearchLoading extends FetchSearchProductsState {}

final class FetchSearchFailure extends FetchSearchProductsState {
  final String error;
  const FetchSearchFailure({required this.error});
}

final class FetchSearchSuccess extends FetchSearchProductsState {
  final ProductModels products;
  const FetchSearchSuccess({required this.products});
}
