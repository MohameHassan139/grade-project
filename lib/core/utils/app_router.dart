import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      // customGoRoute(
      //   name: AppRoutNamed.paySelectView,
      //   path: AppRoutNamed.paySelectView,
      //   child: BlocProvider<FetchSearchBooksCubit>(
      //     create: (context) => FetchSearchBooksCubit(
      //       searchRepo: getIt.get<SearchRepoImpl>(),
      //     ),
      //     child: SearchView(),
      //   ),
      // ),
    ],
  );

  static GoRoute customGoRoute({
    required String path,
    required String name,
    required Widget child,
  }) {
    return GoRoute(
      path: path,
      name: name,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Change the opacity of the screen using a Curve based on the the animation's
            // value
            Offset begin = Offset.fromDirection(BorderSide.strokeAlignInside);
            const end = Offset.zero;
            const curve = Curves.fastOutSlowIn;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      },
    );
  }
}

class AppRoutNamed {
  static const String homeView = '/homeView';
  static const String bookDetails = '/bookDetails';
  static const String SearchView = '/SearchView';
  static const String paySelectView = '/paySelectView';
}
