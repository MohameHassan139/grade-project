import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/core/component/custom_network_image.dart';
import 'package:ar_shopping/features/home/data/models/feedback_model.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class FeedbackWidget extends StatelessWidget {
  final Comments feedback;

  FeedbackWidget({required this.feedback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        width: 80,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CustomNetworkImage(
          imageUrl: feedback.image ?? '',
        ),
      ),
      title: Text(
        feedback.userName ?? "null",
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2),
          ReadMoreText(
            feedback.comment ?? " no comment",
            trimLines: 2,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
            colorClickableText: CustomColors.kGreyColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show more',
            trimExpandedText: ' Show less',
            moreStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: CustomColors.kGreyColor),
          ),
        ],
      ),
      // trailing: Text(
      //   feedback.date,
      //   style: const TextStyle(fontSize: 12, color: Colors.grey),
      // ),
    );
  }
}
