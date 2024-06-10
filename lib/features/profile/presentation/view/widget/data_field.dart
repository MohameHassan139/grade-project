import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';

class CustomUserFledData extends StatelessWidget {
  const CustomUserFledData({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(33, 133, 93, 123),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: CustomColors.kWhiteColor,
        ),
      ),
    );
  }
}
