import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class CustomBody extends StatelessWidget {
  final double bodyHeight;
  final double bodyWidth;
  Widget child;
  CustomBody(
      {required this.bodyHeight, required this.bodyWidth, required this.child});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bodyHeight,
      width: bodyWidth,
      child: Stack(
        children: [
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.kPinkColor,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            top: -88,
            right: -88,
            child: Container(
              height: 166,
              width: 166,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.kPinkColor.withOpacity(0.5),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 166,
                  sigmaY: 166,
                ),
                child: Container(
                  height: 166,
                  width: 166,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.kCyanColor.withOpacity(0.5),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
