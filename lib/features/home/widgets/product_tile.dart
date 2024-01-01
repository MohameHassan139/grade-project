import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/features/home/function/push_screen.dart';
import 'package:ar_shopping/features/home/models/product.dart';
import 'package:ar_shopping/features/home/screens/product_screen.dart';
import 'package:ar_shopping/features/home/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        pushScreen(
          context: context,
          screen: ProductScreen(product: product),
        );
      },
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(product: product),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: CustomColors.kWhiteColor),
            ),
            const Spacer(),
            Text(
              '\$${product.cost.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: CustomColors.kCyanColor),
            )
          ],
        ),
      ),
    );
  }
}
