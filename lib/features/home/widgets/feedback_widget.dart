import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/features/home/models/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class FeedbackWidget extends StatelessWidget {
  final FeedbackModel feedback;

  FeedbackWidget({required this.feedback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        foregroundImage: NetworkImage('${feedback.image}'),
      ),
      title: Text(
        feedback.userName,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: const Color.fromARGB(255, 218, 218, 227),
            fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          ReadMoreText(
            feedback.comment,
            trimLines: 2,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: CustomColors.kWhiteColor),
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
