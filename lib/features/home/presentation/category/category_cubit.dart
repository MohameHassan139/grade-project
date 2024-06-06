import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/category.dart';
import '../../data/repo/home_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.homeRepo}) : super(CategoryInitial());
  HomeRepo homeRepo;

  Future<void> getCategory() async {
    emit(GetCategoryLoading());
    var value = await homeRepo.getCategory();
    value.fold((success) async {
      emit(GetCategorySuccess(categories: success));

      print(success);
    }, (error) {
      print(error.errorMessage);

      emit(GetCategoryFailure(error: error.errorMessage));
    });
  }
}
