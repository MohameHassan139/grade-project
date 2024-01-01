import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../features/auth/widgets/custom_outline.dart';

class CustomBottom extends StatelessWidget {
  VoidCallback? onTap;
  String text;
  double screenHight;
  CustomBottom({this.onTap, required this.text, required this.screenHight});
  @override
  Widget build(BuildContext context) {
    screenHight ?? 0;
    return GestureDetector(
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
        width: 160,
        height: 38,
        padding: const EdgeInsets.all(3),
      ),
    );
  }
}
