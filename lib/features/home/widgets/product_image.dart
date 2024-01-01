import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/features/home/models/product.dart';
import 'package:ar_shopping/features/home/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .95,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: CustomColors.kGreyBackground,
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          product.imageUrls.first,
          loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
              ? child
              : const Center(child: CircularProgressIndicator()),
          color: CustomColors.kGreyBackground,
          colorBlendMode: BlendMode.multiply,
        ),
      ),
    );
  }
}
