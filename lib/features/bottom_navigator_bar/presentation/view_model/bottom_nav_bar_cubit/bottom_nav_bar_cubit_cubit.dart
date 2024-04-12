import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../card/presentation/view/screen_cart.dart';
import '../../../../home/presentation/views/screens/home.dart';
import '../../../../profile/profile.dart';
import '../../../../search/search.dart';

part 'bottom_nav_bar_cubit_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarCubitState> {
  BottomNavBarCubit() : super(BottomNavBarCubitInitial());
  late PageController pageController = PageController(initialPage: 0);
  int navigatorValue = 0;
  List<Widget> screens = [
    HomePage(),
    CartScreen(),
    HomePage(),
    ProfileView(),
    SreachView(),
  ];

  void changeSelecteValue(int selectedValue) {
    navigatorValue = selectedValue;
    pageController.jumpToPage(selectedValue);
    emit(BottomNavBarToggle());
  }

  animateToPage(int selectedValue) {
    navigatorValue = selectedValue;
    pageController.animateToPage(selectedValue,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    emit(BottomNavBarToggle());
  }
}
