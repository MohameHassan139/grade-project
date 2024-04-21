import 'package:ar_shopping/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final title;
  List<Widget>? actions;

  CustomAppbar({required this.title, this.actions});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: CustomColors.kBlackColor,
      title: Text(title),
      centerTitle: true,
      actions: actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.kPinkColor.withOpacity(0.7),
              CustomColors.kCyanColor.withOpacity(0.7),
            ], // Replace with your desired gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
