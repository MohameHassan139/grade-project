import 'package:ar_shopping/core/component/custom_body_bacground.dart';
import 'package:ar_shopping/features/home/data/models/category.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:ar_shopping/features/card/presentation/view/widget/cart_appbar_action.dart';
import 'package:ar_shopping/features/card/presentation/view/widget/product_row.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../widgets/custom_appbar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.category, Key? key}) : super(key: key);
  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

enum Filters { popular, recent, sale }

class _CategoryScreenState extends State<CategoryScreen> {
  Category get category => widget.category;
  Filters filterValue = Filters.popular;
  String? selection;
  late List<Product> _products;

  @override
  void initState() {
    selection = category.selections.first;
    _products = products.where((p) => p.category == category).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    List<ProductRow> productRows = category.selections
        .map((s) => ProductRow(
              productType: s,
              products: _products
                  .where((p) => p.productType.toLowerCase() == s.toLowerCase())
                  .toList(),
            ))
        .toList();
    return Scaffold(
      backgroundColor: CustomColors.kBlackColor,
      appBar: CustomAppbar(
        title: category.title,
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: CustomBody(
        bodyHeight: screenHight,
        bodyWidth: screenWidth,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 18),
          itemCount: productRows.length,
          itemBuilder: (_, index) => productRows[index],
          separatorBuilder: (_, index) => const SizedBox(
            height: 18,
          ),
        ),
      ),
    );
  }
}
