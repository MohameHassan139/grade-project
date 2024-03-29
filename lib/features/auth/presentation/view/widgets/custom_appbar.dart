import 'package:flutter/material.dart';

class CustomWaveAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget title;
  final double barHeight;

  CustomWaveAppBar({key, required this.barHeight, required this.title})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + barHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 100),
        child: ClipPath(
          clipper: WaveClip(),
          child: Container(
            // color: Colors.blue,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.pink,
                  Colors.blue,
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title,
              ],
            ),
          ),
        ));
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
