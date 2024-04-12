import 'package:flutter/material.dart';

import '../../../data/models/order_item.dart';

class Cart with ChangeNotifier {
  List<OrderItem> itemsInCart = [];

  // Private constructor
  Cart._();

  // Singleton instance
  static final Cart _instance = Cart._();

  // Getter for the instance
  factory Cart() {
    return _instance;
  }

  double get totalCost {
    double total = 0;
    for (var item in itemsInCart) {
      total += item.product.cost;
    }
    return total;
  }

  void add(OrderItem orderItem) {
    itemsInCart.add(orderItem);
    notifyListeners();
  }

  void remove(OrderItem orderItem) {
    itemsInCart.remove(orderItem);
    notifyListeners();
  }
}
