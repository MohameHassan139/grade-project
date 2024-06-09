import 'package:ar_shopping/features/product_details/data/repo/product_details_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ReviewState> {
  ProductDetailsCubit({required this.productRepo}) : super(ReviewInitial());
  ProductRepo productRepo;

  Future<void> getReview({required int id}) async {
    emit(GetReviewLoading());

    var value = await productRepo.getProductRate(id: id);
    value.fold((review) async {
      emit(GetReviewSuccess(review: review));
    }, (error) {
      print(error.errorMessage);

      emit(GetReviewFailure(error: error.errorMessage));
    });
  }

 
}
