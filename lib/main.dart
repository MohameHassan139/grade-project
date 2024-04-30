import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/features/home/presentation/views/screens/home.dart';
import 'package:ar_shopping/features/payment/data/repo/payment_repo_impl.dart';
import 'package:ar_shopping/features/payment/presentation/view_model/init_payment_cubit/init_payment_cubit.dart';
import 'package:ar_shopping/features/payment/presentation/views/payment_select_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/service_locator.dart';
import 'features/auth/presentation/view/screens/login_page.dart';
import 'features/auth/presentation/view/screens/register.dart';
import 'features/bottom_navigator_bar/presentation/view/bottom_nav_bar.dart';
import 'features/bottom_navigator_bar/presentation/view_model/bottom_nav_bar_cubit/bottom_nav_bar_cubit_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InitPaymentCubit>(
            create: (context) =>
                InitPaymentCubit(paymentRepo: getIt.get<PaymentRepoImpl>())
            // ..getAuthTokenPayment(),
            ),
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: CustomColors.kPinkColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: CustomColors.kBlackColor,
        ),
        debugShowCheckedModeBanner: false,
        // home: const PaySelectView(),
        home: BottomNavBarView(),
      ),
    );
  }
}
// BottomNavBarCubitCubit