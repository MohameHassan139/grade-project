import 'package:ar_shopping/features/product_details/presentation/view/widgets/feedback_widget.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/product.dart';

class FeedbackList extends StatelessWidget {
  // Replace this list with your actual list of feedback data
  FeedbackList({required this.comments});
  List<Comments> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return FeedbackWidget(feedback: comments[index]);
      },
    );
  }
}
