import 'package:ar_shopping/features/bottom_navigator_bar/presentation/view_model/bottom_nav_bar_cubit/bottom_nav_bar_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/component/custom_outline.dart';
import '../../../card/presentation/view/widget/cart_appbar_action.dart';

class BottomNavBarView extends StatelessWidget {
  BottomNavBarView({super.key});
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BottomNavBarCubit>(context);

    return BlocBuilder<BottomNavBarCubit, BottomNavBarCubitState>(
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) {
              cubit.animateToPage(value);
              cubit.changeSelecteValue(value);
            },
            controller: cubit.pageController,
            children: cubit.screens,
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: cubit.navigatorValue,
            height: 60.0,
            items: <Widget>[
              const Icon(Icons.add, size: 30),
              const CartAppBarAction(),
              const Text(''),
              const Icon(Icons.call_split, size: 30),
              const Icon(Icons.perm_identity, size: 30),
            ],
            color: CustomColors.kCyanColor,
            buttonBackgroundColor: CustomColors.kPinkColor,
            backgroundColor: const Color(0xff404c57),
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              cubit.changeSelecteValue(index);
              cubit.animateToPage(index);
            },
            letIndexChange: (index) => true,
          ),
          floatingActionButton: Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CustomColors.kPinkColor.withOpacity(0.2),
                  CustomColors.kGreenColor.withOpacity(0.2)
                ],
              ),
            ),
            child: Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    CustomColors.kPinkColor,
                    CustomColors.kGreenColor,
                  ],
                ),
              ),
              child: RawMaterialButton(
                onPressed: () {
                  cubit.animateToPage(2);
                  cubit.changeSelecteValue(2);
                },
                shape: const CircleBorder(),
                fillColor: const Color(0xff404c57),
                child: Icon(
                  Icons.home,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
