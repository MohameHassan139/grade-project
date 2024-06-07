import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/colors.dart';
import 'best_seller_item_loading.dart';

class BestSellerProductListShimmer extends StatelessWidget {
  const BestSellerProductListShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.KshimmerBaseColor,
      highlightColor: AppColors.KshimmerHighlightColor,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10, // Number of shimmer items
        itemBuilder: (context, index) {
          return BestSellerItemLoading();
        },
      ),
    );
  }
}
