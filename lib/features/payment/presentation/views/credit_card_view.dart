import 'package:flutter/material.dart';

import '../../../../core/component/custom_body_bacground.dart';

class CreditCardView extends StatelessWidget {
  const CreditCardView({super.key, required this.finalToken});
  final String finalToken;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomBody(
        bodyHeight: height,
        bodyWidth: width,
        child: Container(),
      ),
    );
  }
}
