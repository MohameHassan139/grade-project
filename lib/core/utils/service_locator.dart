import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
}
