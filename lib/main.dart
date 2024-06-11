import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/features/home/data/repo/home_repo_impl.dart';
import 'package:ar_shopping/features/home/presentation/model_view/offer_cubit/home_cubit_cubit.dart';
import 'package:ar_shopping/features/payment/data/repo/payment_repo_impl.dart';
import 'package:ar_shopping/features/payment/presentation/view_model/init_payment_cubit/init_payment_cubit.dart';
import 'package:ar_shopping/features/product_details/presentation/model_view/add_review_cubit/add_review_cubit.dart';
import 'package:ar_shopping/features/profile/data/repo/profile_repo_impl.dart';
import 'package:ar_shopping/features/profile/presentation/model_view/cubit/profile_cubit.dart';
import 'package:ar_shopping/features/search/presentation/view_models/fetch_search_books/fetch_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/cashe_helper.dart';
import 'core/utils/service_locator.dart';
import 'features/auth/data/repo/auth_repo_impl.dart';
import 'features/auth/presentation/model_view/login_cubit/login_cubit.dart';
import 'features/auth/presentation/model_view/register_cubit/register_cubit.dart';
import 'features/auth/presentation/view/screens/login_page.dart';
import 'features/bottom_navigator_bar/presentation/view/bottom_nav_bar.dart';
import 'features/bottom_navigator_bar/presentation/view_model/bottom_nav_bar_cubit/bottom_nav_bar_cubit_cubit.dart';
import 'features/home/presentation/model_view/category/category_cubit.dart';
import 'features/home/presentation/model_view/cubit/sub_category_cubit.dart';
import 'features/product_details/data/repo/product_details_repo_impl.dart';
import 'features/product_details/presentation/model_view/rate_cubit/product_details_cubit.dart';
import 'features/search/data/repos/search_repo_impl.dart';
import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
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
                InitPaymentCubit(paymentRepo: getIt.get<PaymentRepoImpl>())),
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider(
          create: (context) => FetchSearchProuductsCubit(
            searchRepo: getIt.get<SearchRepoImpl>(),
          ),
        ),
        // SubCategoryCubit
        BlocProvider(
          create: (context) => SubCategoryCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => HomeCubitCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..getSpacialOffer(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..getCategory(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(authRepo: getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) =>
              RegisterCubit(authRepo: getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider<ProductDetailsCubit>(
          create: (context) =>
              ProductDetailsCubit(productRepo: getIt.get<ProductRepoImpl>()),
        ),
        BlocProvider<AddReviewCubit>(
          create: (context) =>
              AddReviewCubit(productRepo: getIt.get<ProductRepoImpl>()),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) =>
              ProfileCubit(profileRepo: getIt.get<ProfileRepoImpl>())
                ..getProfile(),
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

        // home: CacheHelper.prefs!.getString('token')!.length > 0
        //     ? BottomNavBarView()
        //     : LoginPage(),
        // home: BottomNavBarView(),
        home: SplashView(),
      ),
    );
  }
}
// ProfileCubit
