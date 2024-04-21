import 'package:ar_shopping/features/product_details/presentation/view/widgets/feedback_widget.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/feedback_model.dart';

class FeedbackList extends StatelessWidget {
  // Replace this list with your actual list of feedback data
  final List<FeedbackModel> feedbackList = [
    FeedbackModel(
      userName: 'User1',
      rating: 4,
      comment:
          'Great product!I absolutely love this product! It exceeded my expectations. The quality is superb, and it arrived sooner than expected. I highly recommend it!',
      date: '2023-01-01',
      image:
          'https://th.bing.com/th/id/OIP.WmwFqgTaMWpX_qFsY5rDSQAAAA?rs=1&pid=ImgDetMain',
    ),
    FeedbackModel(
      userName: 'User2',
      rating: 5,
      comment:
          'This product is a complete disappointment. The quality is poor, and it didn\'t work as advertised. I regret making this purchase. I hope the seller improves the product or offers a refund.!',
      date: '2023-01-02',
      image:
          'https://th.bing.com/th/id/OIP.yd6hCH5WMLTw52S-dLZtHgHaFj?rs=1&pid=ImgDetMain',
    ),
    // Add more feedback items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: feedbackList.length,
      itemBuilder: (context, index) {
        return FeedbackWidget(feedback: feedbackList[index]);
      },
    );
  }
}
