import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:flutter/material.dart';

class OrderItem {
  ProductModel product;

  /// Selected size of product; This can be null
  String? selectedSize;

  /// Selected color of product; This can be null
  String? selectedColor;

  OrderItem({required this.product, this.selectedSize, this.selectedColor});
}
