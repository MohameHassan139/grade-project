// // import 'package:flutter/material.dart';

// // Future<void> pushScreen(
// //     {required BuildContext context, required Widget screen}) async {
// //   ThemeData themeData = Theme.of(context);
// //   Navigator.push(
// //     context,
// //     MaterialPageRoute(
// //       builder: (_) => Theme(data: themeData, child: screen),
// //     ),
// //   );
// // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter/cupertino.dart';

// // Future<void> pushScreen(
// //     {required BuildContext context, required Widget screen}) async {
// //   ThemeData themeData = Theme.of(context);
// //   Navigator.push(
// //     context,
// //     CupertinoPageRoute(
// //       builder: (_) => Theme(data: themeData, child: screen),
// //     ),
// //   );
// // }

// import 'package:flutter/material.dart';

// class MacOsPageRoute<T> extends PageRouteBuilder<T> {
//   final WidgetBuilder builder;

//   MacOsPageRoute({required this.builder})
//       : super(
//           transitionDuration: Duration(milliseconds: 300),
//           pageBuilder: (context, animation, secondaryAnimation) =>
//               builder(context),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             var begin = Offset(0.0, 1.0);
//             var end = Offset.zero;
//             var curve = Curves.easeInOut;

//             var tween =
//                 Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//             var offsetAnimation = animation.drive(tween);

//             return SlideTransition(
//               position: offsetAnimation,
//               child: child,
//             );
//           },
//         );
// }

// Future<void> pushScreen(
//     {required BuildContext context, required Widget screen}) async {
//   ThemeData themeData = Theme.of(context);
//   Navigator.push(
//     context,
//     MacOsPageRoute(
//       builder: (_) => Theme(data: themeData, child: screen),
//     ),
//   );
// // }
// import 'package:flutter/material.dart';

// Future<void> pushScreen({
//   required BuildContext context,
//   required Widget screen,
// }) async {
//   Navigator.push(
//     context,
//     PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => screen,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         var begin = Offset(1.0, 0.0);
//         var end = Offset.zero;
//         var curve = Curves.easeInOut;
//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     ),
//   );
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> pushScreen({
  required BuildContext context,
  required Widget screen,
}) async {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => screen,
    ),
  );
}

Future<void> pushAndRemoveUntil({
  required BuildContext context,
  required Widget screen,
}) async {
  Navigator.pushAndRemoveUntil(
    context,
    CupertinoPageRoute(
      builder: (context) => screen,
    ),
    (Route<dynamic> route) =>
        false, // This predicate removes all the previous routes
  );
}
