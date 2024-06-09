import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/models/after_add_comment_model.dart';
import '../../../data/repo/product_details_repo.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit({required this.productRepo}) : super(AddReviewInitial());
  ProductRepo productRepo;
  var addReviewController = TextEditingController();
  double rate = 0;
  // New methods for bottom sheet state management
  bool bottomSheetClosed = true;
  void openBottomSheet() {
    bottomSheetClosed = false;
    emit(BottomSheetOpened());
  }

  void closeBottomSheet() {
    bottomSheetClosed = true;
    addReviewController.text = '';
    rate = 0;
    emit(BottomSheetClosed());
  }

  void toggleBottomSheet() {
    if (bottomSheetClosed) {
      openBottomSheet();
    } else {
      // Default to opening the bottom sheet if in any other state
      closeBottomSheet();
    }
  }

  Future<void> addComment({
    required int id,
  }) async {
    emit(AddCommentLoading());

    var value = await productRepo.addProductComment(
        id: id, comment: addReviewController.text);
    value.fold((review) async {
      emit(AddCommentSccess());
    }, (error) {
      print(error.errorMessage);

      emit(AddCommentFailure(error: error.errorMessage));
    });
  }

  Future<void> addRate({
    required int id,
  }) async {
    emit(AddRateLoading());

    var value = await productRepo.addProductRate(id: id, rate: rate);
    value.fold((review) async {
      emit(AddCommentSccess());
    }, (error) {
      print(error.errorMessage);

      emit(AddRateFailure(error: error.errorMessage));
    });
  }

  ProductUpdate? productUpdate;
  Future<void> getComment({
    required int id,
  }) async {
    emit(GetCommentLoading());

    var value = await productRepo.getProductAfterComment(id: id);
    value.fold((model) async {
      productUpdate = model;
      emit(GetCommentSccess());
    }, (error) {
      print(error.errorMessage);

      emit(GetCommentFailure(error: error.errorMessage));
    });
  }

  bool isloading = true;
  Future<void> onSubmit(
      {required int id, required BuildContext context}) async {
    isloading = false;
    emit(onSubmitLoading());

    try {
      await addRate(id: id);
      await addComment(id: id);
      await getComment(id: id);
      isloading = true;
      emit(onSubmitSccess());
    } catch (error) {
      isloading = true;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
      emit(onSubmitFailure());
    }
  }
}
