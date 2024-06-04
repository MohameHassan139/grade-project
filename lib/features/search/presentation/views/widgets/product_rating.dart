import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class ProductRating extends StatelessWidget {
  ProductRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.rate,
      this.count});
  final MainAxisAlignment mainAxisAlignment;
  final double? rate;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "${rate ?? 0.0}",
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "(${count ?? 0})",
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}
