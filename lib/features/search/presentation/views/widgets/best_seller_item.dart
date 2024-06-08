import 'package:flutter/material.dart';

import '../../../../../core/component/custom_network_image.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/data/models/product.dart';
import 'product_rating.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.productModel,
  });
  final Product productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 3.2 / 4,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: CustomNetworkImage(
                  imageUrl: productModel.images!.firstOrNull?.url ?? ''),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    productModel.name ?? 'name',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle20,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  productModel.description ?? "Unkown Auther",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Styles.textStyle14,
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      productModel.price ?? 'free',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    ProductRating(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
