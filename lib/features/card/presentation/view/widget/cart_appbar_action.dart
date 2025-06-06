import 'package:ar_shopping/features/card/presentation/view/screen_cart.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import 'cart_list.dart';

class CartAppBarAction extends StatefulWidget {
  const CartAppBarAction({Key? key}) : super(key: key);

  @override
  State<CartAppBarAction> createState() => _CartAppBarActionState();
}

class _CartAppBarActionState extends State<CartAppBarAction> {
  Cart cart = Cart();
  // TODO: Setup cart to listen for changes based on your own state management. Could use riverpod, provider, bloc, etc..
  @override
  void initState() {
    cart.addListener(blankSetState);
    super.initState();
  }

  @override
  void dispose() {
    cart.removeListener(blankSetState);
    super.dispose();
  }

  void blankSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
          ),
          if (cart.itemsInCart.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        cart.itemsInCart.length.toString(),
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      // onPressed: () {
      //   // _pushScreen(
      //   // context: context,
      //   // screen: const CartScreen(),
      //   // );
      // },
    );
  }
}

void _pushScreen({required BuildContext context, required Widget screen}) {
  ThemeData themeData = Theme.of(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Theme(data: themeData, child: screen),
    ),
  );
}

// class Cart with ChangeNotifier {
//   List<OrderItem> itemsInCart = [];

//   double get totalCost {
//     double total = 0;
//     for (var item in itemsInCart) {
//       total += item.product.cost;
//     }
//     return total;
//   }

//   void add(OrderItem orderItem) {
//     itemsInCart.add(orderItem);
//     notifyListeners();
//   }

//   void remove(OrderItem orderItem) {
//     // print(orderItem.product.name);
//     itemsInCart.remove(orderItem);
//     // print(t);
//     notifyListeners();
//   }
// }
