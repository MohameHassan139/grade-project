import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/product_details_repo.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit({required this.productRepo}) : super(AddReviewInitial());
  ProductRepo productRepo;
  TextEditingController addReviewController = TextEditingController();
  double rate = 0;
  // New methods for bottom sheet state management
  bool bottomSheetClosed = true;
  void openBottomSheet() {
    bottomSheetClosed = false;
    emit(BottomSheetOpened());
  }

  void closeBottomSheet() {
    bottomSheetClosed = true;
    addReviewController.clear;
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

  Future<void> onSubmit(
      {required int id, required BuildContext context}) async {
    emit(onSubmitLoading());
    try {
      addRate(id: id);
      addComment(id: id);
      emit(onSubmitSccess());
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
      emit(onSubmitFailure());
    }
  }
}
