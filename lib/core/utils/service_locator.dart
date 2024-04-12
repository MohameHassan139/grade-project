import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/payment/data/repo/payment_repo_impl.dart';
import '../../features/payment/payment_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<PaymentService>(PaymentService());
  getIt.registerSingleton<PaymentRepoImpl>(
      PaymentRepoImpl(paymentService: getIt.get<PaymentService>()));
}
