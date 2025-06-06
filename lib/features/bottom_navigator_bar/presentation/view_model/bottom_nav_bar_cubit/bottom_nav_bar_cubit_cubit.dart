import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../card/presentation/view/screen_cart.dart';
import '../../../../home/presentation/views/screens/home.dart';
import '../../../../notification/notification.dart';
import '../../../../profile/presentation/view/profile.dart';
import '../../../../search/presentation/views/search_view.dart';


part 'bottom_nav_bar_cubit_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarCubitState> {
  BottomNavBarCubit() : super(BottomNavBarCubitInitial());
  late PageController pageController = PageController(initialPage: 0);
  int navigatorValue = 0;
  List<Widget> screens = [
    SearchView(),
    CartScreen(),
    HomePage(),
    NotificationPage(),
    ProfileView(),
    
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
