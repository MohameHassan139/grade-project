import 'package:ar_shopping/features/home/data/repo/home_repo_impl.dart';
import 'package:ar_shopping/features/product_details/data/repo/product_details_repo_impl.dart';
import 'package:ar_shopping/features/profile/data/repo/profile_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/payment/data/repo/payment_repo_impl.dart';
import '../../features/payment/payment_services.dart';
import '../../features/search/data/repos/search_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<PaymentService>(PaymentService());
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  getIt.registerSingleton<ProductRepoImpl>(ProductRepoImpl());
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl());
  getIt.registerSingleton<PaymentRepoImpl>(
      PaymentRepoImpl(paymentService: getIt.get<PaymentService>()));
}
// ProfileRepo