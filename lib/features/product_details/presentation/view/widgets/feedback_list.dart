import 'package:ar_shopping/features/product_details/presentation/view/widgets/feedback_widget.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/product.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FeedbackList extends StatelessWidget {
  // Replace this list with your actual list of feedback data
  FeedbackList({required this.comments});
  final List<Comments> comments;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 130),
            duration: const Duration(milliseconds: 375),
            child: FadeInAnimation(
              // verticalOffset: 30.0,

              child: FadeInAnimation(
                child: FeedbackWidget(feedback: comments[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
