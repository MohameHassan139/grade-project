import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({super.key, required this.imageUrl, this.width});
  double? width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      fit: BoxFit.cover,
      image: NetworkImage(
        imageUrl,
      ),
      loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress != null
              ? Shimmer.fromColors(
                  baseColor: AppColors.KshimmerBaseColor,
                  highlightColor: AppColors.KshimmerHighlightColor,
                  child: Container(

                    color: Colors.grey,
                  ),
                )
              : child,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey,
          child: const Center(
            child: Icon(
              Icons.error,
              size: 40,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
