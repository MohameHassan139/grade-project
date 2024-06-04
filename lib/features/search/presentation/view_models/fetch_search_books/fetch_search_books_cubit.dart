import 'package:bloc/bloc.dart';

import '../../../data/models/product_model.dart';
import '../../../data/repos/search_repo.dart';

part 'fetch_search_books_state.dart';

class FetchSearchProuductsCubit extends Cubit<FetchSearchProductsState> {
  FetchSearchProuductsCubit({required this.searchRepo})
      : super(FetchSearchproductsInitial());

  SearchRepo searchRepo;
  Future<void> search({required String category}) async {
    emit(FetchSearchLoading());
    var result = await searchRepo.fetchSearchedrBooks(category: category);
    result.fold((success) {
      emit(FetchSearchSuccess(products: success));
    }, (failure) {
      emit(FetchSearchFailure(error: failure.errorMessage));
    });
  }
}
