import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/features/home/presentation/views/screens/home.dart';
import 'package:ar_shopping/features/payment/presentation/views/payment_select_view.dart';
import 'package:flutter/material.dart';
import 'features/auth/presentation/view/screens/login_page.dart';
import 'features/auth/presentation/view/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: CustomColors.kPinkColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: CustomColors.kBlackColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const PaySelectView(),
    );
  }
}
