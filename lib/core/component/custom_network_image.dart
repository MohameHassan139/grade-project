// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// import '../utils/colors.dart';

// class CustomNetworkImage extends StatelessWidget {
//   CustomNetworkImage(
//       {super.key, required this.imageUrl, this.width, this.height});
//   double? width;
//   double? height;
//   final String imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     return Image(
//       width: width,
//       fit: BoxFit.cover,
//       image: NetworkImage(
//         imageUrl,
//       ),
//       loadingBuilder: (context, child, loadingProgress) {
//         if (loadingProgress == null) {
//           return child;
//         } else {
//           return Shimmer.fromColors(
//             baseColor: AppColors.KshimmerBaseColor,
//             highlightColor: AppColors.KshimmerHighlightColor,
//             child: Container(
//               color: Colors.grey,
//             ),
//           );
//         }
//       },
//       errorBuilder: (context, error, stackTrace) {
//         print('Error loading image: $error');
//         print(imageUrl);
//         return Container(
//           color: Colors.grey,
//           child: const Center(
//             child: Icon(
//               Icons.error,
//               size: 40,
//               color: Colors.red,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColors.KshimmerBaseColor,
        highlightColor: AppColors.KshimmerHighlightColor,
        child: Container(
          color: Colors.grey,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey,
        child: Center(
          child: Icon(
            Icons.error,
            size: 40,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
