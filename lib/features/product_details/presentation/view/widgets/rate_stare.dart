import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

class CustomRate extends StatelessWidget {
  CustomRate({super.key, required this.rate, this.readOnly});

  double rate;
  bool? readOnly = true;

  @override
  Widget build(BuildContext context) {
    return Rate(
      iconSize: 35,
      color: Colors.amber,

      allowHalf: true,
      allowClear: true,
      initialValue: rate,
      readOnly: readOnly ?? true,
      onChange: (value) => print(value),
      
    );
  }
}
