import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import 'custom_outline.dart';

class CustomBottom extends StatelessWidget {
  VoidCallback? onTap;
  String text;
  double screenHight;
  bool? isloading = true;
  CustomBottom(
      {this.onTap,
      required this.text,
      required this.screenHight,
      this.isloading});
  @override
  Widget build(BuildContext context) {
    screenHight ?? 0;
    return Visibility(
      visible: isloading ?? true,
      replacement: Lottie.asset(
        Constants.loding,
        // height: 40,
        width: 160,
      ),
      child: GestureDetector(
      onTap: onTap,
      child: CustomOutline(
        strokeWidth: 3,
        radius: 20,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.kPinkColor,
            CustomColors.kGreenColor,
          ],
        ),
          width: 160,
          height: 38,
          padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.kPinkColor.withOpacity(0.5),
                CustomColors.kGreenColor.withOpacity(0.5),
              ],
            ),
          ),
          child: Center(
              child: Text(
                '$text',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenHight <= 660 ? 11 : 15,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.kWhiteColor,
                ),
              ),
            
            ),
          ),
        ),
      ),
    );
  }
}
