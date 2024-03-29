import 'package:ar_shopping/constants/app_colors.dart';
import 'package:ar_shopping/core/component/custom_body_bacground.dart';
import 'package:ar_shopping/core/component/custom_botton.dart';
import 'package:ar_shopping/features/home/data/models/feedback_model.dart';
import 'package:ar_shopping/features/home/data/models/order_item.dart';
import 'package:ar_shopping/features/home/data/models/product.dart';
import 'package:ar_shopping/features/home/presentation/views/widgets/cart_appbar_action.dart';
import 'package:ar_shopping/features/home/presentation/views/widgets/cart_list.dart';
import 'package:ar_shopping/features/home/presentation/views/widgets/category_tile.dart';
import 'package:ar_shopping/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:ar_shopping/features/home/presentation/views/widgets/feedback_list.dart';
import 'package:ar_shopping/features/home/presentation/views/widgets/model_viewer.dart';
import 'package:ar_shopping/features/home/presentation/views/widgets/rate_stare.dart';
import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../../../../core/component/custom_outline.dart';
import '../widgets/feedback_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;
  Cart cart = Cart();
  @override
  void initState() {
    selectedImageUrl = product.imageUrls.first;
    selectedSize = product.sizes?.first;
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  int modeView = 1;
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    List<Widget> imagePreviews = product.imageUrls
        .map(
          (url) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => setSelectedImageUrl(url),
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: selectedImageUrl == url
                      ? Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1.75)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  url,
                ),
              ),
            ),
          ),
        )
        .toList();

    List<Widget> sizeSelectionWidgets = product.sizes
            ?.map(
              (s) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setSelectedSize(s);
                  },
                  child: Container(
                    height: 42,
                    width: 80,
                    decoration: BoxDecoration(
                      color: selectedSize == s
                          ? Theme.of(context).colorScheme.secondary
                          : null,
                      border: Border.all(
                        color: Colors.grey[350]!,
                        width: 1.25,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        s,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: selectedSize == s
                                ? Colors.white
                                : Colors.grey[350]),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList() ??
        [];

    Widget objectView(int x) {
      if (x == 1) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                selectedImageUrl!,
                fit: BoxFit.fill,
                color: CustomColors.kGreyBackground,
                colorBlendMode: BlendMode.multiply,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagePreviews,
            ),
          ],
        );
      } else if (x == 3) {
        return Center(
          child: Text('Soon wait....'),
        );
      }
      return ModelView();
    }

    return Scaffold(
      backgroundColor: CustomColors.kBlackColor,
      appBar: CustomAppbar(
        title: '',
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: CustomBody(
        bodyHeight: screenHight,
        bodyWidth: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .35,
                color: CustomColors.kGreyBackground,
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: objectView(modeView),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ModelViewButtom(
                            indexButtom: 1,
                            selectedModel: modeView,
                            onTap: () {
                              setState(() {
                                modeView = 1;
                              });
                            },
                            text: 'Image view',
                          ),
                          ModelViewButtom(
                            indexButtom: 2,
                            selectedModel: modeView,
                            onTap: () {
                              setState(() {
                                modeView = 2;
                              });
                            },
                            text: '3d model view',
                          ),
                          ModelViewButtom(
                            indexButtom: 3,
                            selectedModel: modeView,
                            onTap: () {
                              setState(() {
                                modeView = 3;
                              });
                            },
                            text: 'AR view',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: CustomColors.kGreyBackground),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${product.cost}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: CustomColors.kCyanColor,
                                ),
                          ),
                          Spacer(),
                          CustomRate(),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        product.description ??
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis purus laoreet, efficitur libero vel, feugiat ante. Vestibulum tempor, ligula Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis purus laoreet, efficitur libero vel, feugiat ante. Vestibulum tempor, ligula.',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            height: 1.5, color: CustomColors.kWhiteColor),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      if (sizeSelectionWidgets.isNotEmpty) ...[
                        Text(
                          'Size',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: CustomColors.kGreenColor),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: sizeSelectionWidgets,
                        ),
                      ],
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CustomBottom(
                          screenHight: screenHight,
                          onTap: () {
                            setState(() {
                              cart.add(
                                OrderItem(
                                  product: product,
                                  selectedSize: selectedSize,
                                ),
                              );
                            });
                          },
                          text: 'Add to Cart',
                        ),
                      ),
                      Text(
                        'feedbacks',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: CustomColors.kGreyBackground),
                      ),
                      FeedbackList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModelViewButtom extends StatelessWidget {
  VoidCallback? onTap;
  String text;
  int selectedModel;
  int indexButtom;
  ModelViewButtom(
      {required VoidCallback this.onTap,
      required this.text,
      required this.selectedModel,
      required this.indexButtom});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: CustomOutline(
          strokeWidth: 5,
          radius: 8,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.kPinkColor,
              CustomColors.kGreenColor,
            ],
          ),
          width: 120,
          height: 50,
          padding: const EdgeInsets.all(3),
          child: Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: indexButtom == selectedModel
                  ? Theme.of(context).colorScheme.secondary
                  : null,
              border: Border.all(
                color: Colors.grey[350]!,
                width: 1.25,
              ),
              // borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: indexButtom == selectedModel
                          ? Colors.white
                          : Colors.grey[350],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
