import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/home_repo.dart';

part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit({required this.homeRepo}) : super(SubCategoryInitial());
  HomeRepo homeRepo;
  Future<void> getSubCategory({required int id}) async {
    emit(GetSubCategoryLoading());
    var value = await homeRepo.getProducts(id: id);
    value.fold((success) async {
      emit(GetSubCategorySuccess(products: success));

      print(success);
    }, (error) {
      print(error.errorMessage);

      emit(GetSubCategoryFailure(error: error.errorMessage));
    });
  }
}
