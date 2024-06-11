import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../../constants/constants.dart';
import '../../../../../core/function/push_screen.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/cashe_helper.dart';
import '../../../../auth/presentation/view/screens/login_page.dart';
import '../../../../bottom_navigator_bar/presentation/view/bottom_nav_bar.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    // initAnimation();
    nivgateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 189, 189),
      body: Center(
        child: Lottie.asset(
          Constants.splash,
          // height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  // void initAnimation() {
  //   animationController =
  //       AnimationController(vsync: this, duration: const Duration(seconds: 2));
  //   animation = Tween<Offset>(
  //     begin: const Offset(0, 2),
  //     end: const Offset(0, 0),
  //   ).animate(animationController);
  //   animationController.forward();
  // }

  void nivgateToHome() {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        CacheHelper.prefs?.getString('token') != null
            ? pushAndRemoveUntil(screen: BottomNavBarView(), context: context)
            : pushAndRemoveUntil(screen: LoginPage(), context: context);
      },
    );
  }
}
