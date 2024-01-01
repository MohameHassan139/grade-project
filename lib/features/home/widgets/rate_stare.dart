import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Rate(
      iconSize: 40,
      color: Colors.amber,
      allowHalf: true,
      allowClear: true,
      initialValue: 4.5,
      readOnly: false,
      onChange: (value) => print(value),
    );
  }
}
