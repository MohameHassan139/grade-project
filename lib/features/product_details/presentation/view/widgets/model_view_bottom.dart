import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../core/component/custom_outline.dart';

class ModelViewButtom extends StatelessWidget {
  VoidCallback? onTap;
  String text;
  int selectedModel;
  int indexButtom;
  ModelViewButtom(
      {required VoidCallback this.onTap,
      required this.text,
      required this.selectedModel,
      required this.indexButtom});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: CustomOutline(
          strokeWidth: 5,
          radius: 8,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.kPinkColor,
              CustomColors.kGreenColor,
            ],
          ),
          width: screenWidth * .25,
          height: 50,
          padding: const EdgeInsets.all(3),
          child: Container(
            width: screenWidth * .25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: indexButtom == selectedModel
                  ? Theme.of(context).colorScheme.secondary
                  : null,
              border: Border.all(
                color: Colors.grey[350]!,
                width: 1.25,
              ),
              // borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: indexButtom == selectedModel
                          ? Colors.white
                          : Colors.grey[350],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
