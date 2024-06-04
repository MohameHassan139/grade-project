import 'package:ar_shopping/features/search/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/component/custom_network_image.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import 'product_rating.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.productModel,
  });
  final ProductModels productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.7 / 4,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: CustomNetworkImage(imageUrl: productModel.items ?? ''),
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
                    '{productModel.volumeInfo?.title}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle20,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  productModel.items ?? "Unkown Auther",
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
                      "{productModel.saleInfo?.saleability ?? 'free'}",
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
