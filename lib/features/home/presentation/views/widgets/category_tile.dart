import 'package:ar_shopping/core/component/custom_network_image.dart';
import 'package:ar_shopping/core/function/push_screen.dart';
import 'package:ar_shopping/features/home/data/models/category.dart';

import 'package:ar_shopping/features/home/presentation/views/screens/category_screen.dart';
import 'package:flutter/material.dart';


import '../../../../../constants/app_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {required this.category,
      required this.imageUrl,
      this.imageAlignment = Alignment.center,
      Key? key})
      : super(key: key);
  final String imageUrl;
  final Categories category;


  /// Which part of the image to prefer
  final Alignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.name ?? '',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: CustomColors.kWhiteColor,
              ),
        ),
        InkWell(
          onTap: () => pushScreen(
            context: context,
            screen: CategoryScreen(
              category: category,
            ),
          ),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomNetworkImage(
              imageUrl: imageUrl,
              // color: CustomColors.kGreyBackground,
              // colorBlendMode: BlendMode.darken,
              // alignment: imageAlignment,
              // fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
