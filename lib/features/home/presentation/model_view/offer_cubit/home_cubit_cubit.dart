import 'package:ar_shopping/features/home/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/offer_model.dart';
import '../../../data/models/product.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit({required this.homeRepo}) : super(HomeCubitInitial());
  HomeRepo homeRepo;
  Future<void> getSpacialOffer() async {
    emit(GetSpacialOffertsLoading());
    var value = await homeRepo.getSpacialProdect();
    value.fold((products) async {
      emit(GetSpacialOfferSuccess(products: products));
    }, (error) {
      print(error.toString());
      emit(GetSpacialOfferFailure(error: error.errorMessage));
    });
  }


}
