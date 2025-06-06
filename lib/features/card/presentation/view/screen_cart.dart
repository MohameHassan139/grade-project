import 'package:ar_shopping/core/component/custom_body_bacground.dart';
import 'package:ar_shopping/core/component/custom_botton.dart';
import 'package:ar_shopping/features/card/presentation/view/widget/cart_list.dart';
import 'package:ar_shopping/features/card/presentation/view/widget/product_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import '../../../../constants/app_colors.dart';
import '../../../../core/function/push_screen.dart';
import '../../../payment/presentation/views/payment_select_view.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cart cart = Cart();
  @override
  void initState() {
    super.initState();
    cart.addListener(updateState);
  }

  @override
  void dispose() {
    cart.removeListener(updateState);
    super.dispose();
  }

  void updateState() => setState(() {});
  // bool snapOntapValue = false;
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<Widget> orderItemRows = cart.itemsInCart.map(
      (item) {
        return Row(
          children: [
            SizedBox(
              width: 125,
              child: ProductImage(
                product: item.product,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$${item.product.price}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                cart.remove(item);
              },
              color: Colors.red,
            )
          ],
        );
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CustomColors.kPinkColor.withOpacity(0.7),
                CustomColors.kCyanColor.withOpacity(0.7),
              ], // Replace with your desired gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            const Text('Cart'),
            Text(
              '${cart.itemsInCart.length} items',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
      body: CustomBody(
        bodyHeight: screenHight,
        bodyWidth: screenWidth,
        child: Column(
          children: [
            if (orderItemRows.isNotEmpty)
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  itemCount: orderItemRows.length,
                  itemBuilder: (_, index) => orderItemRows[index],
                  separatorBuilder: (_, index) => const SizedBox(
                    height: 16,
                  ),
                ),
              )
            else
              const Expanded(
                child: Center(
                  child: Text('Your cart is empty'),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '\$${cart.totalCost.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  CustomBottom(
                    onTap: () {
                      pushScreen(context: context, screen: PaySelectView());
                    },
                    text: 'Check Out',
                    screenHight: screenHight,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
